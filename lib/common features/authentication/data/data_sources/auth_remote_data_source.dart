import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lailaty/core/resources/url_manager.dart';
import '../../../../core/error_manager/exception.dart';
import '../../domain/entities/verify_email_request.dart';
import '../models/email_registration_response_model.dart';
import '../../domain/entities/auth_request.dart';
import '../models/verify_email_response_model.dart';

abstract class AuthRemoteDataSource {
  Future<EmailRegistrationResponseModel> register(AuthRequest request);
  Future<VerifyEmailResponseModel> verifyEmail(VerifyEmailRequest request);
}


class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final http.Client client;
  AuthRemoteDataSourceImpl({required this.client});

  @override
  Future<EmailRegistrationResponseModel> register(AuthRequest request) async {
    final url = Uri.parse(UrlManager.emailRegisterURL);

    final response = await client.post(
      url,
      headers: {
        'Accept': 'application/json',
      },
      body: {
        'email': request.email,
        'password': request.password,
      },
    );

    if (response.statusCode == 200) {
      final jsonMap = json.decode(response.body);
      return EmailRegistrationResponseModel.fromJson(jsonMap);
    } else {
      throw const ServerException('Failed to register email');
    }
  }

  @override
  Future<VerifyEmailResponseModel> verifyEmail(
      VerifyEmailRequest request) async {
    final url = Uri.parse(UrlManager.verifyEmailURL);
    final response = await client.post(
      url,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: {
        'email': request.email,
        'verification_code': request.verificationCode,
      },
    );

    if (response.statusCode == 200) {
      final jsonMap = json.decode(response.body);
      return VerifyEmailResponseModel.fromJson(jsonMap);
    } else {
      throw ServerException('Failed to verify email: ${response.body}');
    }
  }
}
