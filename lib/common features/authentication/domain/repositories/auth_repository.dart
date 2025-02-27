import 'package:dartz/dartz.dart';

import '../../../../core/error_manager/failures.dart';
import '../entities/auth_request.dart';
import '../entities/auth_response.dart';
import '../entities/verify_email_request.dart';
import '../entities/verify_email_response.dart';

abstract class AuthRepository {
  Future<Either<Failure, AuthResponse>> register(AuthRequest request);
  Future<Either<Failure, VerifyEmailResponse>> verifyEmail(
      VerifyEmailRequest request);
}
