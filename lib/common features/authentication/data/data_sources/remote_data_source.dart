
import 'package:dartz/dartz.dart';
import 'package:lailaty/common%20features/authentication/data/models/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:lailaty/core/error_manager/exception.dart';

abstract class RemoteDataSource {
  Future<Unit> addUser(UserModel userModel);
}

const BASE_URL = ""; // TODO: add the URL

class RemoteDataSourceImpl implements RemoteDataSource {
  final http.Client client;

  RemoteDataSourceImpl({required this.client});

  @override
  Future<Unit> addUser(UserModel userModel) async {
    final body = {
      "phoneNumber": userModel.phoneNumber,
      "password": userModel.password,
      "firstName": userModel.firstName,
      "lastName": userModel.lastName,
    };

    final response = await client.post(Uri.parse(BASE_URL + "/users/"),
        body: body); // TODO: manage the extension
    if (response.statusCode == 201) {
      return Future.value(unit);
    } else {
      throw ServerException();
    }
  }
}
