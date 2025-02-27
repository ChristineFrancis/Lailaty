import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../../core/error_manager/exception.dart';
import '../../domain/entities/verify_email_request.dart';
import '../models/email_registration_response_model.dart';
import '../../domain/entities/auth_request.dart';
import '../models/verify_email_response_model.dart';

abstract class AuthRemoteDataSource {
  Future<EmailRegistrationResponseModel> register(AuthRequest request);
  Future<VerifyEmailResponseModel> verifyEmail(VerifyEmailRequest request);
}

//!------------------------MY_URLs---------------------------
const baseURL = 'https://laylaty.almowafraty.com/api/v1/auth';

const emailRegisterURL = '$baseURL/emailRegistration';
const verifyEmailURL = '$baseURL/verifyEmail';

//!----------------------------------------------------------

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final http.Client client;
  AuthRemoteDataSourceImpl({required this.client});

  @override
  Future<EmailRegistrationResponseModel> register(AuthRequest request) async {
    final url = Uri.parse(emailRegisterURL);

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
    final url = Uri.parse(verifyEmailURL);
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
