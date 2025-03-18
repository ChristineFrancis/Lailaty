import 'package:dartz/dartz.dart';
import 'package:lailaty/common%20features/authentication/data/models/user_model.dart';
import 'package:lailaty/common%20features/authentication/domain/entities/forgot_password_request.dart';
import 'package:lailaty/common%20features/authentication/domain/entities/forgot_password_response.dart';
import 'package:lailaty/core/services/secure_storage_service.dart';
import '../../../../core/error_manager/exception.dart';
import '../../../../core/error_manager/failures.dart';
import '../../domain/entities/auth_request.dart';
import '../../domain/entities/auth_response.dart';
import '../../domain/entities/login_request.dart';
import '../../domain/entities/login_response.dart';
import '../../domain/entities/logout_request.dart';
import '../../domain/entities/logout_response.dart';
import '../../domain/entities/resend_verification_request.dart';
import '../../domain/entities/resend_verification_response.dart';
import '../../domain/entities/verify_email_request.dart';
import '../../domain/entities/verify_email_response.dart';
import '../../domain/repositories/auth_repository.dart';
import '../data_sources/auth_remote_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final SecureStorageService secureStorageService;
  AuthRepositoryImpl(
      {required this.remoteDataSource, required this.secureStorageService});

  @override
  Future<Either<Failure, AuthResponse>> register(AuthRequest request) async {
    try {
      final response = await remoteDataSource.register(request);
      return Right(response);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, VerifyEmailResponse>> verifyEmail(
      VerifyEmailRequest request) async {
    try {
      final response = await remoteDataSource.verifyEmail(request);
      final user = UserModel.fromJson(response.user);
      await secureStorageService.cacheAuthData(
          user, response.accessToken, response.refreshToken);
      return Right(response);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, ResendVerificationResponse>> resendVerificationCode(
      ResendVerificationRequest request) async {
    try {
      final response = await remoteDataSource.resendVerificationCode(request);
      return Right(response);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, LoginResponse>> login(LoginRequest request) async {
    try {
      final response = await remoteDataSource.login(request);
      final user = UserModel.fromJson(response.user);
      await secureStorageService.cacheAuthData(
          user, response.accessToken, response.refreshToken);
      return Right(response);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, ForgotPasswordResponse>> forgotPassword(
      ForgotPasswordRequest request) async {
    try {
      final response = await remoteDataSource.forgotPassword(request);
      return Right(response);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, LogoutResponse>> logout(LogoutRequest request) async {
    try {
      final response = await remoteDataSource.logout(request);
      await secureStorageService.clearAuthData();
      return Right(response);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }
}
