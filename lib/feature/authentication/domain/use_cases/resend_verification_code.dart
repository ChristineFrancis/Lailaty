import 'package:dartz/dartz.dart';
import 'package:lailaty/core/error_manager/failures.dart';
import '../entities/resend_verification_request.dart';
import '../entities/resend_verification_response.dart';
import '../repositories/auth_repository.dart';

class ResendVerificationCode {
  final AuthRepository repository;
  const ResendVerificationCode({required this.repository});

  Future<Either<Failure, ResendVerificationResponse>> call(
      ResendVerificationRequest request) async {
    return await repository.resendVerificationCode(request);
  }
}
