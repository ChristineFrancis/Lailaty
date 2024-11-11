import 'package:dartz/dartz.dart';
import 'package:lailaty/common%20features/authentication/data/models/verification_model.dart';
import 'package:http/http.dart' as http;
import 'package:lailaty/common%20features/authentication/domain/entities/user.dart';

abstract class RemoteDataSource {
  Future<Unit> addUser(User user);
  Future<List<VerificationModel>> getVerificationCode();
}

const BASE_URL = ""; // TODO: add the URL

class RemoteDataSourceImpl implements RemoteDataSource {
  final http.Client client;

  RemoteDataSourceImpl({required this.client});
  
  @override
  Future<Unit> addUser(User user) {
    // TODO: implement addUser
    throw UnimplementedError();
  }
  
  @override
  Future<List<VerificationModel>> getVerificationCode() {
    // TODO: implement getVerificationCode
    throw UnimplementedError();
  }
}
