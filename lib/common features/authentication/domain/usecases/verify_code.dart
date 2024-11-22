import 'package:dartz/dartz.dart';
import 'package:lailaty/common%20features/authentication/domain/repositories/user_repository.dart';
import 'package:lailaty/core/error_manager/failures.dart';

class VerifyCodeUseCase {
  final UserRepository repository;

  VerifyCodeUseCase(this.repository);

  Future<Either<Failure, Unit>> call(String email, String code) async {
    return await repository.verifyCode(email, code);
  }
}
