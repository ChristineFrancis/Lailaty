import 'package:dartz/dartz.dart';
import 'package:lailaty/common%20features/authentication/domain/entities/verification_code.dart';
import 'package:lailaty/common%20features/authentication/domain/repositories/verification_repository.dart';
import 'package:lailaty/core/error_manager/failures.dart';

class GetVerificationCodeUsecase {
  final VerificationRepository repository;
  GetVerificationCodeUsecase(this.repository);

  Future<Either<Failure, List<VerificationCode>>> call() async {
    return await repository.getVerificationCode();
  }
}
