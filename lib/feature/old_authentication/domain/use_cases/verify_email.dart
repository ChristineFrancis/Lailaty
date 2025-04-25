import 'package:dartz/dartz.dart';
import '../../../../core/error_manager/failures.dart';
import '../entities/verify_email_request.dart';
import '../entities/verify_email_response.dart';
import '../repositories/auth_repository.dart';

class VerifyEmail {
  final AuthRepository repository;
  const VerifyEmail({required this.repository});

  Future<Either<Failure, VerifyEmailResponse>> call(
      VerifyEmailRequest request) async {
    return await repository.verifyEmail(request);
  }
}
