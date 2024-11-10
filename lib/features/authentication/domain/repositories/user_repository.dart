import 'package:dartz/dartz.dart';
import 'package:lailaty/core/error_manager/failures.dart';
import 'package:lailaty/features/authentication/domain/entities/user.dart';

abstract class UserRepository {
  Future<Either<Failure, Unit>> addUser(User user);
}
