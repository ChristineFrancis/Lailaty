// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:lailaty/core/error_manager/error_model.dart';
import 'package:lailaty/core/error_manager/exception.dart';
import 'package:lailaty/core/resources/api_key_manager.dart';
import 'package:lailaty/core/resources/url_manager.dart';
import 'package:lailaty/core/utils/header_fun.dart';
import 'package:lailaty/feature/fleet/data/models/fleet_create_company_request_model.dart';
import 'package:lailaty/feature/fleet/data/models/fleet_create_company_response_model.dart';

abstract class RemoteFleetDatasource {
  Future<FleetCreateCompanyResponseModel> createFleetCompany(
      FleetCreateCompanyRequestModel reques);
}

class RemoteFleetDatasourceImpl implements RemoteFleetDatasource {
  final http.Client client;
  RemoteFleetDatasourceImpl({
    required this.client,
  });

  @override
  Future<FleetCreateCompanyResponseModel> createFleetCompany(
      FleetCreateCompanyRequestModel request) async {
    final Uri url = Uri.parse(UrlManager.createFleetCompany);
    var requestBody = http.MultipartRequest('POST', url);

    requestBody.headers.addAll(getHeader(true)!);
    requestBody.fields[ApiKeyManager.name] = request.name;
    requestBody.fields[ApiKeyManager.phoneNumber] = request.phoneNumber;
    requestBody.fields[ApiKeyManager.latitude] = request.latitude.toString();
    requestBody.fields[ApiKeyManager.longitude] = request.longitude.toString();
    requestBody.files.add(await http.MultipartFile.fromPath(
        ApiKeyManager.commercialRegistrationCard,
        request.commercialRegistrationCard.path));
    requestBody.files.add(await http.MultipartFile.fromPath(
        ApiKeyManager.taxCard, request.taxCard.path));

    try {
      final streamedResponse = await requestBody.send();
      final response = await http.Response.fromStream(streamedResponse);

      print("Response Body: ${response.body}");
      print("Status Code: ${response.statusCode}");

      if (response.statusCode == 200) {
        final decodedJson = json.decode(response.body);

        // Extracting the "office" key
        if (decodedJson.containsKey('office')) {
          return FleetCreateCompanyResponseModel.fromJson(
              decodedJson['office']);
        } else {
          throw ServerException(
              errorModel: ErrorModel(
                  errorMessage:
                      "Invalid response format: Missing 'office' key"));
        }
      } else {
        final Map<String, dynamic> errorJson = jsonDecode(response.body);
        final String errorMessage =
            errorJson['message'] ?? 'Unknown error occurred';

        throw ServerException(
            errorModel: ErrorModel(errorMessage: errorMessage));
      }
    } catch (e) {
      print('Exception Caught: $e');

      if (e is SocketException) {
        throw ServerException(
            errorModel: ErrorModel(errorMessage: "No Internet Connection"));
      } else if (e is FormatException) {
        throw ServerException(
            errorModel: ErrorModel(errorMessage: "Invalid response format"));
      } else if (e is ServerException) {
        throw e;
      } else {
        throw ServerException(
            errorModel:
                ErrorModel(errorMessage: "Unexpected error: ${e.toString()}"));
      }
    }
  }
}
