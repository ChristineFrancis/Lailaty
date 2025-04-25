import 'package:dartz/dartz.dart';
import 'package:lailaty/core/error_manager/exception.dart';
import 'package:lailaty/core/error_manager/failures.dart';
import 'package:lailaty/core/config/storage/secure_storage_service.dart';
import 'package:lailaty/feature/authentication/data/data_sources/auth_remote_data_source.dart';
import 'package:lailaty/feature/authentication/data/models/user_model.dart';
import 'package:lailaty/feature/authentication/domain/entities/auth_request.dart';
import 'package:lailaty/feature/authentication/domain/entities/auth_response.dart';
import 'package:lailaty/feature/authentication/domain/entities/forgot_password_request.dart';
import 'package:lailaty/feature/authentication/domain/entities/forgot_password_response.dart';
import 'package:lailaty/feature/authentication/domain/entities/info_register_request.dart';
import 'package:lailaty/feature/authentication/domain/entities/login_request.dart';
import 'package:lailaty/feature/authentication/domain/entities/login_response.dart';
import 'package:lailaty/feature/authentication/domain/entities/logout_request.dart';
import 'package:lailaty/feature/authentication/domain/entities/logout_response.dart';
import 'package:lailaty/feature/authentication/domain/entities/resend_verification_request.dart';
import 'package:lailaty/feature/authentication/domain/entities/resend_verification_response.dart';
import 'package:lailaty/feature/authentication/domain/entities/verify_email_request.dart';
import 'package:lailaty/feature/authentication/domain/entities/verify_email_response.dart';
import 'package:lailaty/feature/authentication/domain/repositories/auth_repository.dart';

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
      return Left(ServerFailure(e.errorMessage));
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
      return Left(ServerFailure(e.errorMessage));
    }
  }

  @override
  Future<Either<Failure, ResendVerificationResponse>> resendVerificationCode(
      ResendVerificationRequest request) async {
    try {
      final response = await remoteDataSource.resendVerificationCode(request);
      return Right(response);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorMessage));
    }
  }

  @override
  Future<Either<Failure, LoginResponse>> login(LoginRequest request) async {
    try {
      final response = await remoteDataSource.login(request);
      final user = UserModel.fromJson(response.user);
      print('user :${response.user}');
      await secureStorageService.cacheAuthData(
          user, response.accessToken, response.refreshToken);
      return Right(response);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorMessage));
    }
  }

  @override
  Future<Either<Failure, ForgotPasswordResponse>> forgotPassword(
      ForgotPasswordRequest request) async {
    try {
      final response = await remoteDataSource.forgotPassword(request);
      return Right(response as ForgotPasswordResponse);
//or :
// final response = await remoteDataSource.forgotPassword(request);
// return Right(ForgotPasswordResponse(message: response.message));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorMessage));
    }
  }

  @override
  Future<Either<Failure, LogoutResponse>> logout(LogoutRequest request) async {
    try {
      final response = await remoteDataSource.logout(request);
      await secureStorageService.clearAuthData();
      return Right(response);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorMessage));
    }
  }

  @override
  Future<Either<Failure, UserModel>> informationRegister(
      InfoRegisterRequest request) async {
    try {
      //!get the token from storage
      final cachedData = await secureStorageService.getCachedAuthData();
      final token = cachedData.fold(
          (l) => null, (data) => data?['access_token'] as String?);
      if (token == null) {
        return Left(ServerFailure('No toke found'));
      }

      final responseMap =
          await remoteDataSource.informationRegister(request, token: token);

      final updatedUser = UserModel.fromJson(responseMap['user']);

      final refreshToken = (await secureStorageService.getCachedAuthData())
          .fold((l) => '', (data) => data?['refresh_token'] as String? ?? '');

      await secureStorageService.cacheAuthData(
          updatedUser, token, refreshToken);

      /* await secureStorageService.cacheAuthData(
          updatedUser,
          token,
          (await secureStorageService.getCachedAuthData()).fold(
              (l) => '', (data) => data?['refresh_token'] as String? ?? ''));*/

      return Right(updatedUser);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorMessage));
    }
  }
}
