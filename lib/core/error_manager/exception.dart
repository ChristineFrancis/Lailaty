import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:lailaty/core/error_manager/error_model.dart';

class NoConnectionExecption implements Exception {}

class ServerException implements Exception {
  final ErrorModel errorModel;

  ServerException({required this.errorModel});

  String get errorMessage => errorModel.errorMessage;
}

class EmptyCashExecption implements Exception {}


void handleHttpExceptions(http.Response response) {
  switch (response.statusCode) {
    case 400: // Bad Request
      // Handle Bad Request - Often contains details in the body about what was wrong
      _handleBadRequest(response);
      break;

    case 401: // Unauthorized
      // Handle Unauthorized - Typically indicates the user is not authenticated
      _handleUnauthorized(response);
      break;

    case 403: // Forbidden
      // Handle Forbidden - User does not have the right permissions
      _handleForbidden(response);
      break;

    case 404: // Not Found
      // Handle Not Found - The endpoint or resource is not available
      _handleNotFound(response);
      break;

    case 409: // Conflict
      // Handle Conflict - Typically occurs when there is a conflict with the current state of the resource
      _handleConflict(response);
      break;

    case 422: // Unprocessable Entity
      // Handle Unprocessable Entity - Often validation errors
      _handleUnprocessableEntity(response);
      break;

    case 429: // Too Many Requests
      // Handle Too Many Requests - Typically when the API rate limit is exceeded
      _handleTooManyRequests(response);
      break;

    case 500: // Internal Server Error
    case 502: // Bad Gateway
    case 503: // Service Unavailable
    case 504: // Gateway Timeout
      // Handle Server Errors - Typically something went wrong on the server side
      _handleServerError(response);
      break;

    default:
      // Handle unexpected errors - Any other status codes that weren't specifically handled above
      _handleUnexpectedError(response);
  }
}

void _handleBadRequest(http.Response response) {
  throw ServerException(
    errorModel: ErrorModel.fromJson(jsonDecode(response.body) ??
        {
          'errorMessage': 'Bad Request - Please check your input or try again.'
        }),
  );
}

void _handleUnauthorized(http.Response response) {
  throw ServerException(
    errorModel: ErrorModel.fromJson(jsonDecode(response.body) ??
        {
          'errorMessage':
              'Unauthorized - Please check your credentials or login.'
        }),
  );
}

void _handleForbidden(http.Response response) {
  throw ServerException(
    errorModel: ErrorModel.fromJson(jsonDecode(response.body) ??
        {
          'errorMessage':
              'Forbidden - You do not have permission to access this resource.'
        }),
  );
}

void _handleNotFound(http.Response response) {
  throw ServerException(
    errorModel: ErrorModel.fromJson(jsonDecode(response.body) ??
        {
          'errorMessage':
              'Not Found - The resource you are looking for could not be found.'
        }),
  );
}

void _handleConflict(http.Response response) {
  throw ServerException(
    errorModel: ErrorModel.fromJson(jsonDecode(response.body) ??
        {
          'errorMessage':
              'Conflict - There is a conflict with the current state of the resource.'
        }),
  );
}

void _handleUnprocessableEntity(http.Response response) {
  throw ServerException(
    errorModel: ErrorModel.fromJson(jsonDecode(response.body) ??
        {
          'errorMessage':
              'Unprocessable Entity - Please check your input and try again.'
        }),
  );
}

void _handleTooManyRequests(http.Response response) {
  throw ServerException(
    errorModel: ErrorModel.fromJson(jsonDecode(response.body) ??
        {
          'errorMessage':
              'Too Many Requests - You have exceeded the rate limit. Please try again later.'
        }),
  );
}

void _handleServerError(http.Response response) {
  throw ServerException(
    errorModel: ErrorModel(
        errorMessage:
            'Internal Server Error - Something went wrong on the server side.'),
  );
}

void _handleUnexpectedError(http.Response response) {
  throw ServerException(
    errorModel: ErrorModel(
      errorMessage: 'Unexpected error occurred: ${response.statusCode}.',
    ),
  );
}
