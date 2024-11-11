import 'package:dartz/dartz.dart';
import 'package:lailaty/common%20features/authentication/domain/entities/user.dart';
import 'package:lailaty/common%20features/authentication/domain/repositories/user_repository.dart';
import 'package:lailaty/core/error_manager/failures.dart';

class AddUserUsecase {
  final UserRepository repository;
  AddUserUsecase(this.repository);

  Future<Either<Failure, Unit>> call(User user) async {
    return await repository.addUser(user);
  }
}
