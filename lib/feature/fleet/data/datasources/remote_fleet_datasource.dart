import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:lailaty/core/auth/auth_service.dart';
import 'package:lailaty/core/error_manager/error_model.dart';
import 'package:lailaty/core/error_manager/exception.dart';
import 'package:lailaty/core/resources/api_key_manager.dart';
import 'package:lailaty/core/resources/url_manager.dart';
import 'package:lailaty/feature/fleet/data/models/fleet_company_models/fleet_create_company_request_model.dart';
import 'package:lailaty/feature/fleet/data/models/fleet_company_models/fleet_create_company_response_model.dart';
import 'package:lailaty/feature/fleet/data/models/fleet_to_join_models/create_work_request_model.dart';
import 'package:lailaty/feature/fleet/data/models/fleet_to_join_models/fleets_model.dart';
import 'package:lailaty/feature/fleet/data/models/personal_fleet_models/create_personal_fleet_request.dart';
import 'package:lailaty/feature/fleet/data/models/personal_fleet_models/create_personal_fleet_response.dart';

abstract class RemoteFleetDatasource {
  Future<FleetCreateCompanyResponseModel> createFleetCompany(
      FleetCreateCompanyRequestModel reques); //! done ✅

  Future<FleetCreatePersonalResponseModel> createPersonalFleet(
      FleetCreatePersonRequestModel reques);//! done ✅

  Future<List<GetAllFleetModel>> getAllFleets(); //! done ✅

  Future<List<GetAllFleetModel>> getSearchedFleet(String parameter); //! done ✅

  Future<CreateWorkRequestModel> createWorkRequest(int officeId); //! done ✅
}

class RemoteFleetDatasourceImpl implements RemoteFleetDatasource {
  final ApiClient _apiClient;
  //  final ApiClient _apiClient;
  // final SecureStorageService _storage;
  RemoteFleetDatasourceImpl({
    required ApiClient apiClient,
//  required ApiClient apiClient,
//     required SecureStorageService storage,
  }) : _apiClient = apiClient;
//*________________________________________________________________________________
  @override
  Future<FleetCreateCompanyResponseModel> createFleetCompany(
      FleetCreateCompanyRequestModel request) async {
    try {
      // 👈 تجهيز ملفات الـ Multipart بشكل غير متزامن قبل buildRequest
      final commercialFile = await http.MultipartFile.fromPath(
        ApiKeyManager.commercialRegistrationCard,
        request.commercialRegistrationCard.path,
      );

      final taxFile = await http.MultipartFile.fromPath(
        ApiKeyManager.taxCard,
        request.taxCard.path,
      );

      // 👇 استدعاء ApiClient مع استخدام الملفات التي تم تجهيزها
      final response = await _apiClient.multipartRequest(
        UrlManager.createFleetCompany,
        buildRequest: () {
          final req = http.MultipartRequest(
            'POST',
            Uri.parse(UrlManager.createFleetCompany),
          );

          req.fields[ApiKeyManager.name] = request.name;
          req.fields[ApiKeyManager.phoneNumber] = request.phoneNumber;
          req.fields[ApiKeyManager.latitude] = request.latitude.toString();
          req.fields[ApiKeyManager.longitude] = request.longitude.toString();

          req.files.add(commercialFile);
          req.files.add(taxFile);

          return req;
        },
      );

      print("📥 Response Body: ${response.body}");
      print("📊 Status Code: ${response.statusCode}");

      if (response.statusCode == 200) {
        final decodedJson = json.decode(response.body);
        if (decodedJson.containsKey('office')) {
          return FleetCreateCompanyResponseModel.fromJson(
              decodedJson['office']);
        } else {
          throw ServerException(
            errorModel: ErrorModel(
                errorMessage: "Invalid response format: Missing 'office' key"),
          );
        }
      } else {
        final Map<String, dynamic> errorJson = jsonDecode(response.body);
        final String errorMessage =
            errorJson['message'] ?? 'Unknown error occurred';

        throw ServerException(
            errorModel: ErrorModel(errorMessage: errorMessage));
      }
    } catch (e) {
      print('❗ Exception Caught: $e');

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
              ErrorModel(errorMessage: "Unexpected error: ${e.toString()}"),
        );
      }
    }
  }

//! old correct one :

  // @override
  // Future<FleetCreateCompanyResponseModel> createFleetCompany(
  //     FleetCreateCompanyRequestModel request) async {
  //   final Uri url = Uri.parse(UrlManager.createFleetCompany);
  //   var requestBody = http.MultipartRequest('POST', url);
  //   final headers = await getHeader(true);
  //   print('Headers being used: $headers');
  //   requestBody.headers.addAll(headers);
  //   requestBody.fields[ApiKeyManager.name] = request.name;
  //   requestBody.fields[ApiKeyManager.phoneNumber] = request.phoneNumber;
  //   requestBody.fields[ApiKeyManager.latitude] = request.latitude.toString();
  //   requestBody.fields[ApiKeyManager.longitude] = request.longitude.toString();
  //   requestBody.files.add(await http.MultipartFile.fromPath(
  //       ApiKeyManager.commercialRegistrationCard,
  //       request.commercialRegistrationCard.path));
  //   requestBody.files.add(await http.MultipartFile.fromPath(
  //       ApiKeyManager.taxCard, request.taxCard.path));

  //   try {
  //     final streamedResponse = await requestBody.send();
  //     final response = await http.Response.fromStream(streamedResponse);

  //     print("Response Body: ${response.body}");
  //     print("Status Code: ${response.statusCode}");

  //     if (response.statusCode == 200) {
  //       final decodedJson = json.decode(response.body);

  //       // Extracting the "office" key
  //       if (decodedJson.containsKey('office')) {
  //         return FleetCreateCompanyResponseModel.fromJson(
  //             decodedJson['office']);
  //       } else {
  //         throw ServerException(
  //             errorModel: ErrorModel(
  //                 errorMessage:
  //                     "Invalid response format: Missing 'office' key"));
  //       }
  //     } else {
  //       final Map<String, dynamic> errorJson = jsonDecode(response.body);
  //       final String errorMessage =
  //           errorJson['message'] ?? 'Unknown error occurred';

  //       throw ServerException(
  //           errorModel: ErrorModel(errorMessage: errorMessage));
  //     }
  //   } catch (e) {
  //     print('Exception Caught: $e');

  //     if (e is SocketException) {
  //       throw ServerException(
  //           errorModel: ErrorModel(errorMessage: "No Internet Connection"));
  //     } else if (e is FormatException) {
  //       throw ServerException(
  //           errorModel: ErrorModel(errorMessage: "Invalid response format"));
  //     } else if (e is ServerException) {
  //       throw e;
  //     } else {
  //       throw ServerException(
  //           errorModel:
  //               ErrorModel(errorMessage: "Unexpected error: ${e.toString()}"));
  //     }
  //   }
  // }

//**______create personal fleet: ________________________________________________________________________________
  @override
  Future<FleetCreatePersonalResponseModel> createPersonalFleet(
      FleetCreatePersonRequestModel request) async {
    try {
      final response = await _apiClient.multipartRequest(
        UrlManager.createFleetPersonal,
        buildRequest: () {
          final multipart = http.MultipartRequest(
              'POST', Uri.parse(UrlManager.createFleetPersonal));
          multipart.fields[ApiKeyManager.name] = request.name;
          multipart.fields[ApiKeyManager.phoneNumber] = request.phoneNumber;
          multipart.fields[ApiKeyManager.latitude] =
              request.latitude.toString();
          multipart.fields[ApiKeyManager.longitude] =
              request.longitude.toString();
          return multipart;
        },
      );

      print("📥 Response Body: ${response.body}");
      print("📡 Status Code: ${response.statusCode}");

      if (response.statusCode == 200) {
        final decodedJson = json.decode(response.body);

        if (decodedJson.containsKey('office')) {
          return FleetCreatePersonalResponseModel.fromJson(
              decodedJson['office']);
        } else {
          throw ServerException(
            errorModel: ErrorModel(
              errorMessage: "Invalid response format: Missing 'office' key",
            ),
          );
        }
      } else {
        final errorJson = jsonDecode(response.body);
        final errorMessage = errorJson['message'] ?? 'Unknown error occurred';

        throw ServerException(
            errorModel: ErrorModel(errorMessage: errorMessage));
      }
    } catch (e) {
      print('❌ Exception Caught: $e');

      if (e is SocketException) {
        throw ServerException(
          errorModel: ErrorModel(errorMessage: "No Internet Connection"),
        );
      } else if (e is FormatException) {
        throw ServerException(
          errorModel: ErrorModel(errorMessage: "Invalid response format"),
        );
      } else if (e is ServerException) {
        throw e;
      } else {
        throw ServerException(
          errorModel:
              ErrorModel(errorMessage: "Unexpected error: ${e.toString()}"),
        );
      }
    }
  }

  //! old way :
  // @override
  // Future<FleetCreatePersonalResponseModel> createPersonalFleet(
  //     FleetCreatePersonRequestModel request) async {
  //   final Uri url = Uri.parse(UrlManager.createFleetPersonal);
  //   var requestBody = http.MultipartRequest('POST', url);
  //   final headers = await getHeader(true);
  //   print('Headers being used: $headers');
  //   requestBody.headers.addAll(headers);
  //   requestBody.fields[ApiKeyManager.name] = request.name;
  //   requestBody.fields[ApiKeyManager.phoneNumber] = request.phoneNumber;
  //   requestBody.fields[ApiKeyManager.latitude] = request.latitude.toString();
  //   requestBody.fields[ApiKeyManager.longitude] = request.longitude.toString();

  //   try {
  //     final streamedResponse = await requestBody.send();
  //     final response = await http.Response.fromStream(streamedResponse);

  //     print("Response Body: ${response.body}");
  //     print("Status Code: ${response.statusCode}");

  //     if (response.statusCode == 200) {
  //       final decodedJson = json.decode(response.body);

  //       // Extracting the "office" key
  //       if (decodedJson.containsKey('office')) {
  //         return FleetCreatePersonalResponseModel.fromJson(
  //             decodedJson['office']);
  //       } else {
  //         throw ServerException(
  //             errorModel: ErrorModel(
  //                 errorMessage:
  //                     "Invalid response format: Missing 'office' key"));
  //       }
  //     } else {
  //       final Map<String, dynamic> errorJson = jsonDecode(response.body);
  //       final String errorMessage =
  //           errorJson['message'] ?? 'Unknown error occurred';

  //       throw ServerException(
  //           errorModel: ErrorModel(errorMessage: errorMessage));
  //     }
  //   } catch (e) {
  //     print('Exception Caught: $e');

  //     if (e is SocketException) {
  //       throw ServerException(
  //           errorModel: ErrorModel(errorMessage: "No Internet Connection"));
  //     } else if (e is FormatException) {
  //       throw ServerException(
  //           errorModel: ErrorModel(errorMessage: "Invalid response format"));
  //     } else if (e is ServerException) {
  //       throw e;
  //     } else {
  //       throw ServerException(
  //           errorModel:
  //               ErrorModel(errorMessage: "Unexpected error: ${e.toString()}"));
  //     }
  //   }
  // }
//**_________get all fleets : ______________________________________________________________________________________
//! correct :

  // @override
  // Future<List<GetAllFleetModel>> getAllFleets() async {
  //   final Uri url = Uri.parse(UrlManager.getAllFleets);
  //   final headers = await getHeader(true);

  //   print('Headers being used: $headers');

  //   try {
  //     final response = await http.get(url, headers: headers);

  //     print("Response Body: ${response.body}");
  //     print("Status Code: ${response.statusCode}");

  //     if (response.statusCode == 200) {
  //       final List<dynamic> decodedJson = json.decode(response.body);

  //       //! Debug:
  //       for (var item in decodedJson) {
  //         print("Fleet JSON Item: $item");
  //       }

  //       // Convert to model list
  //       final List<GetAllFleetModel> fleets =
  //           decodedJson.map((item) => GetAllFleetModel.fromJson(item)).toList();

  //       print("Parsed Fleet Models: $fleets");

  //       return fleets;
  //     } else {
  //       final Map<String, dynamic> errorJson = jsonDecode(response.body);
  //       final String errorMessage =
  //           errorJson['message'] ?? 'Unknown error occurred';

  //       throw ServerException(
  //           errorModel: ErrorModel(errorMessage: errorMessage));
  //     }
  //   } catch (e) {
  //     print('Exception Caught: $e');

  //     if (e is SocketException) {
  //       throw ServerException(
  //           errorModel: ErrorModel(errorMessage: "No Internet Connection"));
  //     } else if (e is FormatException) {
  //       throw ServerException(
  //           errorModel: ErrorModel(errorMessage: "Invalid response format"));
  //     } else if (e is ServerException) {
  //       throw e;
  //     } else {
  //       throw ServerException(
  //           errorModel:
  //               ErrorModel(errorMessage: "Unexpected error: ${e.toString()}"));
  //     }
  //   }
  // }

//! test :

  @override
  Future<List<GetAllFleetModel>> getAllFleets() async {
    try {
      final response = await _apiClient.get(UrlManager.getAllFleets);

      if (response.statusCode == 200) {
        final List<dynamic> decodedJson = json.decode(response.body);
        return decodedJson
            .map((item) => GetAllFleetModel.fromJson(item))
            .toList();
      } else {
        final errorJson = json.decode(response.body);
        throw ServerException(
          errorModel: ErrorModel(
            errorMessage: errorJson['message'] ?? 'Unknown error',
          ),
        );
      }
    } catch (e) {
      print('Unknown exception in getAllFleets: $e');
      throw ServerException(
        errorModel: ErrorModel(
          errorMessage: "Unexpected error: ${e.toString()}",
        ),
      );
    }
  }

//**______search fleet : __________________________________________________________________________________________
  //! new way :
  @override
  Future<List<GetAllFleetModel>> getSearchedFleet(String parameter) async {
    final uri = UrlManager.getAllFleets;
    try {
      final response = await _apiClient.get(
        uri,
        queryParameters: {'name': parameter},
      );

      print("Response Body: ${response.body}");
      print("Status Code: ${response.statusCode}");

      if (response.statusCode == 200) {
        final List<dynamic> decodedJson = json.decode(response.body);

        for (var item in decodedJson) {
          print("Fleet JSON Item: $item");
        }

        final fleets =
            decodedJson.map((item) => GetAllFleetModel.fromJson(item)).toList();

        print("Parsed Fleet Models: $fleets");
        return fleets;
      } else {
        // حالة خطأ غير 200
        final errorJson = jsonDecode(response.body);
        final msg = errorJson['message'] ?? 'Unknown error occurred';
        throw ServerException(errorModel: ErrorModel(errorMessage: msg));
      }
    } catch (e) {
      print('Exception Caught in getSearchedFleet: $e');

      if (e is ServerException) {
        // تمت إعادة رميه داخل interceptor أو هنا
        rethrow;
      } else {
        // أخطاء شبكة أو تنسيق JSON
        final message = e is http.ClientException
            ? "No Internet Connection"
            : e is FormatException
                ? "Invalid response format"
                : "Unexpected error: ${e.toString()}";
        throw ServerException(errorModel: ErrorModel(errorMessage: message));
      }
    }
  }
  //!correct old way :
  // @override
  // Future<List<GetAllFleetModel>> getSearchedFleet(String parameter) async {
  //   final Uri url = Uri.parse(UrlManager.getAllFleets)
  //       .replace(queryParameters: {'name': parameter});

  //   final headers = await getHeader(true);

  //   print('Headers being used: $headers');
  //   print('Request URL: $url');

  //   try {
  //     final response = await http.get(url, headers: headers);

  //     print("Response Body: ${response.body}");
  //     print("Status Code: ${response.statusCode}");

  //     if (response.statusCode == 200) {
  //       final List<dynamic> decodedJson = json.decode(response.body);

  //       //! Debug:
  //       for (var item in decodedJson) {
  //         print("Fleet JSON Item: $item");
  //       }

  //       final List<GetAllFleetModel> fleets =
  //           decodedJson.map((item) => GetAllFleetModel.fromJson(item)).toList();

  //       print("Parsed Fleet Models: $fleets");

  //       return fleets;
  //     } else {
  //       final Map<String, dynamic> errorJson = jsonDecode(response.body);
  //       final String errorMessage =
  //           errorJson['message'] ?? 'Unknown error occurred';

  //       throw ServerException(
  //         errorModel: ErrorModel(errorMessage: errorMessage),
  //       );
  //     }
  //   } catch (e) {
  //     print('Exception Caught: $e');

  //     if (e is SocketException) {
  //       throw ServerException(
  //         errorModel: ErrorModel(errorMessage: "No Internet Connection"),
  //       );
  //     } else if (e is FormatException) {
  //       throw ServerException(
  //         errorModel: ErrorModel(errorMessage: "Invalid response format"),
  //       );
  //     } else if (e is ServerException) {
  //       throw e;
  //     } else {
  //       throw ServerException(
  //         errorModel:
  //             ErrorModel(errorMessage: "Unexpected error: ${e.toString()}"),
  //       );
  //     }
  //   }
  // }
//?_________request to join fleet: _____________________________________________________________________________
//!correct old way :
  // @override
  // Future<CreateWorkRequestModel> createWorkRequest(int officeId) async {
  //   final Uri url = Uri.parse(UrlManager.createWorkRequest(officeId));

  //   final headers = await getHeader(true);

  //   print('Headers being used: $headers');
  //   print('Request URL: $url');

  //   try {
  //     final response = await http.post(url, headers: headers);

  //     print("Response Body: ${response.body}");
  //     print("Status Code: ${response.statusCode}");

  //     if (response.statusCode == 201) {
  //       final Map<String, dynamic> decodedJson = json.decode(response.body);

  //       //! Debug:
  //       print("Decoded JSON: $decodedJson");

  //       final CreateWorkRequestModel model =
  //           CreateWorkRequestModel.fromJson(decodedJson['request']);

  //       print("Parsed CreateWorkRequestModel: $model");

  //       return model;
  //     } else {
  //       final Map<String, dynamic> errorJson = jsonDecode(response.body);
  //       final String errorMessage =
  //           errorJson['message'] ?? 'Unknown error occurred';

  //       throw ServerException(
  //         errorModel: ErrorModel(errorMessage: errorMessage),
  //       );
  //     }
  //   } catch (e) {
  //     print('Exception Caught: $e');

  //     if (e is SocketException) {
  //       throw ServerException(
  //         errorModel: ErrorModel(errorMessage: "No Internet Connection"),
  //       );
  //     } else if (e is FormatException) {
  //       throw ServerException(
  //         errorModel: ErrorModel(errorMessage: "Invalid response format"),
  //       );
  //     } else if (e is ServerException) {
  //       throw e;
  //     } else {
  //       throw ServerException(
  //         errorModel:
  //             ErrorModel(errorMessage: "Unexpected error: ${e.toString()}"),
  //       );
  //     }
  //   }
  // }
  //!test the new way ;

  @override
  Future<CreateWorkRequestModel> createWorkRequest(int officeId) async {
    final uri = UrlManager.createWorkRequest(officeId);

    try {
      final response = await _apiClient.post(uri);

      print("Response Body: ${response.body}");
      print("Status Code: ${response.statusCode}");

      if (response.statusCode == 201) {
        final decodedJson = json.decode(response.body);
        final model = CreateWorkRequestModel.fromJson(decodedJson['request']);

        print("Parsed CreateWorkRequestModel: $model");
        return model;
      } else {
        final errorJson = jsonDecode(response.body);
        final String errorMessage =
            errorJson['message'] ?? 'Unknown error occurred';

        throw ServerException(
          errorModel: ErrorModel(errorMessage: errorMessage),
        );
      }
    } catch (e) {
      print('Exception Caught: $e');

      if (e is ServerException) throw e;

      throw ServerException(
        errorModel:
            ErrorModel(errorMessage: "Unexpected error: ${e.toString()}"),
      );
    }
  }
}
