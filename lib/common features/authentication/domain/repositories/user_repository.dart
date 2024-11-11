import 'package:dartz/dartz.dart';
import 'package:lailaty/common%20features/authentication/domain/entities/user.dart';
import 'package:lailaty/core/error_manager/failures.dart';

abstract class UserRepository {
  Future<Either<Failure, Unit>> addUser(User user);
}
