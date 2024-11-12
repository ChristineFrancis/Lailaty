import 'package:dartz/dartz.dart';
import 'package:lailaty/common%20features/authentication/data/models/user_model.dart';
import 'package:lailaty/common%20features/authentication/domain/entities/user.dart';
import 'package:lailaty/common%20features/authentication/domain/repositories/user_repository.dart';
import 'package:lailaty/core/error_manager/exception.dart';
import 'package:lailaty/core/error_manager/failures.dart';
import 'package:lailaty/core/network/network_connection.dart';
import 'package:lailaty/common%20features/authentication/data/data_sources/remote_data_source.dart';

class UserRepositoryImpl extends UserRepository {
  final RemoteDataSource remoteDataSource;
  final NetworkConnection networkConnection;

  UserRepositoryImpl(
      {required this.remoteDataSource, required this.networkConnection});

  @override
  Future<Either<Failure, Unit>> addUser(User user) async {
    final UserModel userModel = UserModel(
      phoneNumber: user.phoneNumber,
      password: user.password,
      firstName: user.firstName,
      lastName: user.lastName,
    );

    if (await networkConnection.isConnected) {
      try {
        await remoteDataSource.addUser(userModel);
        return Right(unit);
      } on ServerException {
        return left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}
