import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:lailaty/common%20features/authentication/data/models/user_model.dart';
import 'package:lailaty/common%20features/authentication/data/models/verification_model.dart';
import 'package:http/http.dart' as http;
import 'package:lailaty/core/error_manager/exception.dart';

abstract class RemoteDataSource {
  Future<Unit> addUser(UserModel userModel);
  Future<List<VerificationModel>> getVerificationCode();
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

  @override
  Future<List<VerificationModel>> getVerificationCode() async {
    final response = await client.get(
        Uri.parse(
            BASE_URL + "/verification_code/"), // TODO: manage the extension
        headers: {"Content-Type": "application/json"});

    if (response.statusCode == 200) {
      final List decodedJson = json.decode(response.body) as List;
      final List<VerificationModel> verificationModels = decodedJson
          .map<VerificationModel>((jsonVerificationModel) => VerificationModel.fromJson(jsonVerificationModel))
          .toList();
      return verificationModels;
    } else {
      throw ServerException();
    }
  }
}
