import 'package:dartz/dartz.dart';
import 'package:lailaty/core/error_manager/failures.dart';
import 'package:lailaty/core/network/network_connection.dart';
import 'package:lailaty/features/authentication/data/data_sources/remote_data_source.dart';
import 'package:lailaty/features/authentication/domain/entities/user.dart';
import 'package:lailaty/features/authentication/domain/repositories/user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  final RemoteDataSource remoteDataSource;
  final NetworkConnection networkConnection;

  UserRepositoryImpl(
      {required this.remoteDataSource, required this.networkConnection});

  @override
  Future<Either<Failure, Unit>> addUser(User user) {
    // TODO: implement addUser
    throw UnimplementedError();
  }
}
