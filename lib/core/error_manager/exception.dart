import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:lailaty/core/error_manager/error_model.dart';

class NoConnectionExecption implements Exception {}

//class ServerExecption implements Exception {}
// class ServerException implements Exception {
//   final String message;
//   const ServerException([this.message = 'Server Exception Occurred']);
// }



class ServerException implements Exception {
  final ErrorModel errorModel;
  ServerException({
    required this.errorModel,
  });
}

class EmptyCashExecption implements Exception {}
void handleHttpExceptions(http.Response response) {
  switch (response.statusCode) {
    case 400: // Bad request
    case 401: // Unauthorized
    case 403: // Forbidden
    case 404: // Not Found
    case 409: // Conflict
    case 422: // Unprocessable Entity
    case 429: // Too Many Requests
      throw ServerException(errorModel: ErrorModel.fromJson(jsonDecode(response.body)));

    case 500: // Internal Server Error
    case 502: // Bad Gateway
    case 503: // Service Unavailable
    case 504: // Gateway Timeout
      throw ServerException(errorModel: ErrorModel(errorMessage: "خطأ داخلي في الخادم"));

    default:
      throw ServerException(errorModel: ErrorModel(errorMessage: "خطأ غير متوقع: ${response.statusCode}"));
  }
}
