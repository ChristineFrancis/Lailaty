import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:lailaty/core/resources/api_key_manager.dart';

import '../../../../core/error_manager/failures.dart';
import '../entities/auth_request.dart';
import '../entities/auth_response.dart';
import '../entities/forgot_password_request.dart';
import '../entities/forgot_password_response.dart';
import '../entities/login_request.dart';
import '../entities/login_response.dart';
import '../entities/resend_verification_request.dart';
import '../entities/resend_verification_response.dart';
import '../entities/verify_email_request.dart';
import '../entities/verify_email_response.dart';

abstract class AuthRepository {
  Future<Either<Failure, AuthResponse>> register(AuthRequest request);
  Future<Either<Failure, VerifyEmailResponse>> verifyEmail(
      VerifyEmailRequest request);
  Future<Either<Failure, ResendVerificationResponse>> resendVerificationCode(
      ResendVerificationRequest request);
  Future<Either<Failure, LoginResponse>> login(LoginRequest request);
  Future<Either<Failure, ForgotPasswordResponse>> forgotPassword(
      ForgotPasswordRequest request);
}




