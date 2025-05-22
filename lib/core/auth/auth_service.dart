import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'package:lailaty/core/config/storage/secure_storage_service.dart';
import 'package:lailaty/core/resources/url_manager.dart';

abstract class AuthTokenHandler {
  Future<bool> refreshToken();
  Future<void> logout();
}

//?____________________________________________________________________
//Refreshes the token, clears it on logout:
class AuthService implements AuthTokenHandler {
  final SecureStorageService _storage;
  final ApiClient _apiClient;

  AuthService({
    required SecureStorageService storage,
    required ApiClient apiClient,
  })  : _storage = storage,
        _apiClient = apiClient;

  @override
  Future<bool> refreshToken() async {
    print('🔁 محاولة تجديد الـ Token...');
    try {
      final refreshToken = await _storage.getRefreshToken();
      print(
          '🔄 الـ Refresh Token المستخدم: ${refreshToken != null ? 'موجود' : 'غير موجود'}');

      if (refreshToken == null) return false;
      print('📤 إرسال طلب تجديد الـ Token إلى السيرفر...');

      final response = await _apiClient.post(
        UrlManager.refreshTokenUrl,
        body: {'refresh_token': refreshToken},
        includeToken: false, // Don't include token for refresh request
      );

      print('📥 استجابة السيرفر: ${response.statusCode}');
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        print('✅ تم تجديد الـ Token بنجاح');
        await _storage.saveTokensData({
          'access_token': data['access_token'],
          'refresh_token': data['refresh_token'],
        });
        return true;
      }
      print('❌ فشل تجديد الـ Token: ${response.body}');
      return false;
    } catch (e) {
      print('❌ خطأ في تجديد الـ Token: $e');
      return false;
    }
  }

  @override
  Future<void> logout() async {
    print('👋 تسجيل الخروج وحذف جميع الـ Tokens');
    await _storage.clearAuthData();
    navigatorKey.currentContext?.goNamed(
      'decider',
    );
  }
}

//?__token______________________________________________________________
//Detects 401, triggers refresh logic, retries the request :
class TokenInterceptor {
  final SecureStorageService _storage;
  final AuthTokenHandler _authHandler;

  TokenInterceptor({
    required SecureStorageService storage,
    required AuthTokenHandler authHandler,
  })  : _storage = storage,
        _authHandler = authHandler;

  Future<http.Response> interceptRequest(
    Future<http.Response> Function(Map<String, String> headers) requestFn,
  ) async {
    var headers = await _getHeadersWithToken();
    var response = await requestFn(headers);

    if (response.statusCode == 401) {
      final refreshed = await _authHandler.refreshToken();
      if (refreshed) {
        headers = await _getHeadersWithToken();
        response = await requestFn(headers);
      } else {
        await _authHandler.logout();
      }
    }

    return response;
  }

  Future<Map<String, String>> _getHeadersWithToken() async {
    final token = await _storage.getAccessToken();
    return {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
  }
}

//?__api client____________________________________________________________________
//Wraps the HTTP client and uses TokenInterceptor :
class ApiClient {
  final TokenInterceptor _interceptor;
  final http.Client _client;

  ApiClient({
    required TokenInterceptor interceptor,
    required http.Client client,
  })  : _interceptor = interceptor,
        _client = client;

  Future<http.Response> get(
    String url, {
    Map<String, String>? headers,
    Map<String, dynamic>? queryParameters,
  }) async {
    return _interceptor.interceptRequest((authHeaders) async {
      final mergedHeaders = {...?headers, ...authHeaders};
      final uri = _buildUri(url, queryParameters);
      return await _client.get(uri, headers: mergedHeaders);
    });
  }

  Future<http.Response> post(
    String url, {
    dynamic body,
    Map<String, String>? headers,
    Map<String, dynamic>? queryParameters,
    bool includeToken = true,
  }) async {
    if (!includeToken) {
      final uri = _buildUri(url, queryParameters);
      return await _client.post(
        uri,
        body: body is Map ? json.encode(body) : body,
        headers: headers,
      );
    }

    return _interceptor.interceptRequest((authHeaders) async {
      final mergedHeaders = {
        'Content-Type': 'application/json',
        ...?headers,
        ...authHeaders,
      };
      final uri = _buildUri(url, queryParameters);
      return await _client.post(
        uri,
        body: body is Map ? json.encode(body) : body,
        headers: mergedHeaders,
      );
    });
  }

  Future<http.Response> put(
    String url, {
    dynamic body,
    Map<String, String>? headers,
    Map<String, dynamic>? queryParameters,
  }) async {
    return _interceptor.interceptRequest((authHeaders) async {
      final mergedHeaders = {
        'Content-Type': 'application/json',
        ...?headers,
        ...authHeaders,
      };
      final uri = _buildUri(url, queryParameters);
      return await _client.put(
        uri,
        body: body is Map ? json.encode(body) : body,
        headers: mergedHeaders,
      );
    });
  }

  Future<http.Response> delete(
    String url, {
    dynamic body,
    Map<String, String>? headers,
    Map<String, dynamic>? queryParameters,
  }) async {
    return _interceptor.interceptRequest((authHeaders) async {
      final mergedHeaders = {
        ...?headers,
        ...authHeaders,
      };
      final uri = _buildUri(url, queryParameters);
      return await _client.delete(
        uri,
        body: body is Map ? json.encode(body) : body,
        headers: mergedHeaders,
      );
    });
  }

  Future<http.Response> multipartRequest(
    String url, {
    required http.MultipartRequest Function() buildRequest,
    Map<String, dynamic>? queryParameters,
  }) async {
    return _interceptor.interceptRequest((authHeaders) async {
      final request = buildRequest();
      final uri = _buildUri(url, queryParameters);
      request.headers.addAll(authHeaders);
      final modifiedRequest = http.MultipartRequest(
        request.method,
        uri,
      )
        ..headers.addAll(request.headers)
        ..fields.addAll(request.fields)
        ..files.addAll(request.files);
      final streamedResponse = await _client.send(modifiedRequest);
      return await http.Response.fromStream(streamedResponse);
    });
  }

  Uri _buildUri(String url, Map<String, dynamic>? queryParameters) {
    if (queryParameters == null) return Uri.parse(url);

    return Uri.parse(url).replace(
      queryParameters: queryParameters.map(
        (key, value) => MapEntry(key, value?.toString()),
      ),
    );
  }

  // Important: Call this when app is closing
  void close() {
    _client.close();
  }
}

//_____________________________________________________________________________
class ProxyAuthTokenHandler implements AuthTokenHandler {
  late AuthTokenHandler _real;

  void bind(AuthTokenHandler real) {
    _real = real;
  }

  @override
  Future<bool> refreshToken() => _real.refreshToken();

  @override
  Future<void> logout() => _real.logout();
}

// to make the navigation to the login page if the refresh token failed :
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
