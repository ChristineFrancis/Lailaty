import 'dart:convert';
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:lailaty/core/auth/auth_service.dart';
import 'package:lailaty/core/error_manager/error_model.dart';
import 'package:lailaty/core/error_manager/exception.dart';
import 'package:lailaty/core/resources/api_key_manager.dart';
import 'package:lailaty/core/resources/url_manager.dart';
import 'package:lailaty/feature/agree_pages/carInfo/data/models/captain_registration_documents_request_model.dart';
import 'package:lailaty/feature/agree_pages/carInfo/data/models/captain_registration_documents_response_message_model.dart';
import 'package:lailaty/feature/agree_pages/carInfo/data/models/car_brand_model.dart';
import 'package:lailaty/feature/agree_pages/carInfo/data/models/car_registration_request_model.dart';
import 'package:lailaty/feature/agree_pages/carInfo/data/models/car_registration_response_model.dart';
import 'package:lailaty/feature/agree_pages/carInfo/data/models/motorcycle_registration_request_model.dart';

abstract class AgreePagesRemoteDateSource {
  Future<List<BrandsCarModel>> getBrandsCar();
  Future<VehicleRegistrationResponseModel> addCar(
      CarRegistrationRequestModel car, String param);
  Future<VehicleRegistrationResponseModel> addMotor(
      MotorcycleRegistrationRequestModel motor, String param);
  Future<CaptainRegistrationDocumentsResponseModel> captainRegister(
      CaptainRegistrationDocumentsModel request);
}

class AgreePagesRemoteDateSourceImpl implements AgreePagesRemoteDateSource {
  final ApiClient _apiClient;
  AgreePagesRemoteDateSourceImpl({
    required ApiClient apiClient,
  }) : _apiClient = apiClient;

//new way :
  @override
  Future<VehicleRegistrationResponseModel> addCar(
      CarRegistrationRequestModel request, String param) async {
    try {
      print('try sending data ');
      //  Prepare files outside of buildRequest
      final image1 =
          await http.MultipartFile.fromPath("image_1", request.image1.path);
      final image2 =
          await http.MultipartFile.fromPath("image_2", request.image2.path);
      final image3 =
          await http.MultipartFile.fromPath("image_3", request.image3.path);
      final image4 =
          await http.MultipartFile.fromPath("image_4", request.image4.path);
      final image5 =
          await http.MultipartFile.fromPath("image_5", request.image5.path);
      final face1 =
          await http.MultipartFile.fromPath("face_1", request.face1.path);
      final face2 =
          await http.MultipartFile.fromPath("face_2", request.face2.path);

      final response = await _apiClient.multipartRequest(
        "${UrlManager.addVeicleUrl}/$param",
        buildRequest: () {
          final multipart = http.MultipartRequest(
            'POST',
            Uri.parse("${UrlManager.addVeicleUrl}/$param"),
          );

          //  Add headers
          // getHeader(true).then((headers) {
          //   multipart.headers.addAll(headers);
          // });

          //Add fields
          multipart.fields["model_year"] = request.modelYear;
          multipart.fields["car_brand_id"] = request.carBrandId.toString();
          multipart.fields["colore"] = request.color;
          multipart.fields["is_modified"] = request.isModified ? "1" : "0";
          multipart.fields["gear_type"] = request.gearType;
          multipart.fields["license_plate"] = request.licensePlate;
          multipart.fields["more_than_four_seats"] =
              request.moreThanFourSeats ? "1" : "0";

          if (request.originalCarBrandId != null) {
            multipart.fields["original_car_brand_id"] =
                request.originalCarBrandId.toString();
          }

          // Add files
          multipart.files.addAll([
            image1,
            image2,
            image3,
            image4,
            image5,
            face1,
            face2,
          ]);

          // if (extraImage != null) {
          //   multipart.files.add(extraImage);
          // }

          return multipart;
        },
      );

      print("📥 Response Body: ${response.body}");
      print("📡 Status Code: ${response.statusCode}");

      if (response.statusCode == 201) {
        final decodedJson = json.decode(response.body);
        return VehicleRegistrationResponseModel.fromJson(decodedJson);
      } else {
        final errorJson = jsonDecode(response.body);
        final errorMessage = errorJson['message'] ?? 'حدث خطأ غير معروف';

        throw ServerException(
          errorModel: ErrorModel(errorMessage: errorMessage),
        );
      }
    } catch (e) {
      print('❌ Exception Caught: $e');

      if (e is SocketException) {
        throw ServerException(
          errorModel: ErrorModel(errorMessage: "لا يوجد اتصال بالإنترنت"),
        );
      } else if (e is FormatException) {
        throw ServerException(
          errorModel: ErrorModel(errorMessage: "تنسيق الاستجابة غير صالح"),
        );
      } else if (e is ServerException) {
        throw e;
      } else {
        throw ServerException(
          errorModel:
              ErrorModel(errorMessage: "حدث خطأ غير متوقع: ${e.toString()}"),
        );
      }
    }
  }

//________________________________________________________________________________
@override
Future<VehicleRegistrationResponseModel> addMotor(
    MotorcycleRegistrationRequestModel request, String param) async {
  try {
    print('🚀 Trying to send motorcycle registration data');

    // Prepare files!!
    final image1 =
        await http.MultipartFile.fromPath("image_1", request.image1.path);
    final face1 =
        await http.MultipartFile.fromPath("face_1", request.face1.path);
    final face2 =
        await http.MultipartFile.fromPath("face_2", request.face2.path);

    final response = await _apiClient.multipartRequest(
      "${UrlManager.addVeicleUrl}/$param",
      buildRequest: () {
        final multipart = http.MultipartRequest(
          'POST',
          Uri.parse("${UrlManager.addVeicleUrl}/$param"),
        );

        // Add fields
        multipart.fields["model_year"] = request.modelYear;
        multipart.fields["license_plate"] = request.licensePlate;

        // Add files
        multipart.files.addAll([
          image1,
          face1,
          face2,
        ]);

        return multipart;
      },
    );

    print("📥 Motorcycle Response Body: ${response.body}");
    print("📡 Status Code: ${response.statusCode}");

    if (response.statusCode == 201) {
      final decodedJson = json.decode(response.body);
      return VehicleRegistrationResponseModel.fromJson(decodedJson);
    } else {
      final errorJson = jsonDecode(response.body);
      final errorMessage = errorJson['message'] ?? 'حدث خطأ غير معروف';

      throw ServerException(
        errorModel: ErrorModel(errorMessage: errorMessage),
      );
    }
  } catch (e) {
    print('❌ Exception Caught: $e');

    if (e is SocketException) {
      throw ServerException(
        errorModel: ErrorModel(errorMessage: "لا يوجد اتصال بالإنترنت"),
      );
    } else if (e is FormatException) {
      throw ServerException(
        errorModel: ErrorModel(errorMessage: "تنسيق الاستجابة غير صالح"),
      );
    } else if (e is ServerException) {
      throw e;
    } else {
      throw ServerException(
        errorModel:
            ErrorModel(errorMessage: "حدث خطأ غير متوقع: ${e.toString()}"),
      );
    }
  }
}

//__________________________________________________________________________________
  @override
  Future<List<BrandsCarModel>> getBrandsCar() async {
    try {
      final response = await _apiClient.get(
        UrlManager.getBrandUrl,
      );

      print("📥 Response Body: ${response.body}");
      print("📡 Status Code: ${response.statusCode}");

      //  في حالة نجاح الاستجابة
      if (response.statusCode == 200) {
        final decodedJson = jsonDecode(response.body);
        final List<dynamic> brandsJson = decodedJson['brands'];
        final List<BrandsCarModel> brands = brandsJson
            .map((jsonItem) => BrandsCarModel.fromJson(jsonItem))
            .toList();

        return brands;
      } else {
        final errorJson = jsonDecode(response.body);
        final errorMessage = errorJson['message'] ?? 'Unknown error occurred';

        throw ServerException(
          errorModel: ErrorModel(errorMessage: errorMessage),
        );
      }
    } catch (e) {
      print('❌ Exception Caught: $e');

      if (e is SocketException) {
        throw ServerException(
          errorModel: ErrorModel(errorMessage: "لا يوجد اتصال بالإنترنت"),
        );
      } else if (e is FormatException) {
        throw ServerException(
          errorModel: ErrorModel(errorMessage: "تنسيق الاستجابة غير صالح"),
        );
      } else if (e is ServerException) {
        throw e;
      } else {
        throw ServerException(
          errorModel:
              ErrorModel(errorMessage: "حدث خطأ غير متوقع: ${e.toString()}"),
        );
      }
    }
  }

//*_____________________________________________________________________________
  @override
  Future<CaptainRegistrationDocumentsResponseModel> captainRegister(
      CaptainRegistrationDocumentsModel request) async {
    try {
      final personalImage = await http.MultipartFile.fromPath(
          ApiKeyManager.personalImage, request.personalImage.path);
      final driverLicenseFrontFace = await http.MultipartFile.fromPath(
          ApiKeyManager.driverLicenseFrontFace,
          request.driverLicenseFrontFace.path);
      final driverLicenseBackFace = await http.MultipartFile.fromPath(
          ApiKeyManager.driverLicenseBackFace,
          request.driverLicenseBackFace.path);
      final personalCardFrontFace = await http.MultipartFile.fromPath(
          ApiKeyManager.personalCardFrontFace,
          request.personalCardFrontFace.path);
      final personalCardBackFace = await http.MultipartFile.fromPath(
          ApiKeyManager.personalCardBackFace,
          request.personalCardBackFace.path);

      http.MultipartFile? criminalRecord;
      if (request.criminalRecord != null) {
        criminalRecord = await http.MultipartFile.fromPath(
            ApiKeyManager.criminalRecord, request.criminalRecord!.path);
      }

      final response = await _apiClient.multipartRequest(
        UrlManager.captianRegisterUrl,
        buildRequest: () {
          final multipart = http.MultipartRequest(
            'POST',
            Uri.parse(UrlManager.captianRegisterUrl),
          );

          multipart.fields[ApiKeyManager.birthDate] = request.birthDate;

          multipart.files.addAll([
            personalImage,
            driverLicenseFrontFace,
            driverLicenseBackFace,
            personalCardFrontFace,
            personalCardBackFace,
          ]);

          if (criminalRecord != null) {
            multipart.files.add(criminalRecord);
          }

          return multipart;
        },
      );

      print("📥 Response Body: ${response.body}");
      print("📡 Status Code: ${response.statusCode}");

      if (response.statusCode == 200) {
        final decodedJson = json.decode(response.body);
        return CaptainRegistrationDocumentsResponseModel.fromJson(decodedJson);
      } else {
        final errorJson = jsonDecode(response.body);
        final errorMessage = errorJson['message'] ?? 'Unknown error occurred';

        throw ServerException(
          errorModel: ErrorModel(errorMessage: errorMessage),
        );
      }
    } catch (e) {
      print('❌ Exception Caught: $e');

      if (e is SocketException) {
        throw ServerException(
          errorModel: ErrorModel(errorMessage: "لا يوجد اتصال بالإنترنت"),
        );
      } else if (e is FormatException) {
        throw ServerException(
          errorModel: ErrorModel(errorMessage: "تنسيق الاستجابة غير صالح"),
        );
      } else if (e is ServerException) {
        throw e;
      } else {
        throw ServerException(
          errorModel:
              ErrorModel(errorMessage: "حدث خطأ غير متوقع: ${e.toString()}"),
        );
      }
    }
  }
}
