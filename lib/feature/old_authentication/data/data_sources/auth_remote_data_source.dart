import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lailaty/core/error_manager/error_model.dart';
import 'package:lailaty/core/resources/url_manager.dart';
import 'package:lailaty/feature/old_authentication/data/models/forgot_password_response_model.dart';
import 'package:lailaty/feature/old_authentication/domain/entities/forgot_password_request.dart';
import '../../../../core/error_manager/exception.dart';
import '../../domain/entities/login_request.dart';
import '../../domain/entities/resend_verification_request.dart';
import '../../domain/entities/verify_email_request.dart';
import '../models/email_registration_response_model.dart';
import '../../domain/entities/auth_request.dart';
import '../models/login_response_model.dart';
import '../models/resend_verification_response_model.dart';
import '../models/verify_email_response_model.dart';

abstract class AuthRemoteDataSource {
  Future<EmailRegistrationResponseModel> register(AuthRequest request);
  Future<VerifyEmailResponseModel> verifyEmail(VerifyEmailRequest request);
  Future<ResendVerificationResponseModel> resendVerificationCode(
      ResendVerificationRequest request);
  Future<LoginResponseModel> login(LoginRequest request);
  Future<ForgotPasswordResponseModel> forgotPassword(
      ForgotPasswordRequest request);
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
      throw  ServerException(errorModel: ErrorModel(errorMessage: 'Failed to send reset link: ${response.body}'));
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
      throw ServerException(errorModel: ErrorModel(errorMessage: 'Failed to verify email: ${response.body}'));
    }
  }

  @override
  Future<ResendVerificationResponseModel> resendVerificationCode(
      ResendVerificationRequest request) async {
    final url = Uri.parse(UrlManager.resendVerificationCodeURL);
    final response = await client.post(
      url,
      headers: {'Accept': 'application/json'},
      body: {
        'email': request.email.trim(),
      },
    );

    if (response.statusCode == 200) {
      final jsonMap = json.decode(response.body);
      return ResendVerificationResponseModel.fromJson(jsonMap);
    } else {
      final jsonMap = json.decode(response.body);
      String errorMessage =
          jsonMap['message'] ?? 'Failed to resend verification code';
      if (jsonMap['errors'] != null && jsonMap['errors']['email'] != null) {
        errorMessage += ": " + (jsonMap['errors']['email'] as List).join(', ');
      }
      throw ServerException(errorModel: ErrorModel(errorMessage: errorMessage));
    }
  }

  @override
  Future<LoginResponseModel> login(LoginRequest request) async {
    final url = Uri.parse(UrlManager.loginURL);
    final response = await client.post(
      url,
      headers: {'Accept': 'application/json'},
      body: {
        'email': request.email.trim(),
        'password': request.password,
      },
    );
    if (response.statusCode == 200) {
      final jsonMap = json.decode(response.body);
      return LoginResponseModel.fromJson(jsonMap);
    } else {
      throw ServerException(errorModel: ErrorModel(errorMessage:  'Failed to login: ${response.body}'));
    }
  }

  @override
  Future<ForgotPasswordResponseModel> forgotPassword(
      ForgotPasswordRequest request) async {
    final url = Uri.parse(UrlManager.forgotPasswordURL);
    final response = await client.post(
      url,
      headers: {'Accept': 'application/json'},
      body: {
        'email': request.email.trim(),
      },
    );

    if (response.statusCode == 200) {
      final jsonMap = json.decode(response.body);
      return ForgotPasswordResponseModel.fromJson(jsonMap);
    } else {
      throw ServerException(errorModel: ErrorModel(errorMessage: 'Failed to send reset link: ${response.body}'));
    }
  }
}
