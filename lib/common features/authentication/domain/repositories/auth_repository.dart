import 'package:dartz/dartz.dart';
import 'package:lailaty/common%20features/authentication/data/models/user_model.dart';
import 'package:lailaty/common%20features/authentication/domain/entities/info_register_request.dart';

import '../../../../core/error_manager/failures.dart';
import '../entities/auth_request.dart';
import '../entities/auth_response.dart';
import '../entities/forgot_password_request.dart';
import '../entities/forgot_password_response.dart';
import '../entities/login_request.dart';
import '../entities/login_response.dart';
import '../entities/logout_request.dart';
import '../entities/logout_response.dart';
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
  Future<Either<Failure, LogoutResponse>> logout(LogoutRequest request);
  Future<Either<Failure, UserModel>> informationRegister(
      InfoRegisterRequest request);
}
