import 'package:dartz/dartz.dart';
import '../../../../core/error_manager/exception.dart';
import '../../../../core/error_manager/failures.dart';
import '../../domain/entities/auth_request.dart';
import '../../domain/entities/auth_response.dart';
import '../../domain/entities/login_request.dart';
import '../../domain/entities/login_response.dart';
import '../../domain/entities/resend_verification_request.dart';
import '../../domain/entities/resend_verification_response.dart';
import '../../domain/entities/verify_email_request.dart';
import '../../domain/entities/verify_email_response.dart';
import '../../domain/repositories/auth_repository.dart';
import '../data_sources/auth_remote_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  AuthRepositoryImpl({required this.remoteDataSource});

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
      return Right(response);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }
}
