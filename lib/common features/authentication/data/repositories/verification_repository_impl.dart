import 'package:dartz/dartz.dart';
import 'package:lailaty/common%20features/authentication/data/data_sources/remote_data_source.dart';
import 'package:lailaty/common%20features/authentication/domain/entities/verification_code.dart';
import 'package:lailaty/common%20features/authentication/domain/repositories/verification_repository.dart';
import 'package:lailaty/core/error_manager/failures.dart';
import 'package:lailaty/core/network/network_connection.dart';

class VerificationRepositoryImpl extends VerificationRepository {
  final RemoteDataSource remoteDataSource;
  final NetworkConnection networkConnection;

  VerificationRepositoryImpl(
      {required this.remoteDataSource, required this.networkConnection});

  @override
  Future<Either<Failure, List<VerificationCode>>> getVerificationCode() {
    // TODO: implement getVerificationCode
    throw UnimplementedError();
  }
}
