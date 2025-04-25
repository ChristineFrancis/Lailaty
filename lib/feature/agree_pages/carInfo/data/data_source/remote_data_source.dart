import 'dart:convert';
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:lailaty/core/error_manager/error_model.dart';
import 'package:lailaty/core/error_manager/exception.dart';
import 'package:lailaty/core/resources/api_key_manager.dart';
import 'package:lailaty/core/resources/url_manager.dart';
import 'package:lailaty/core/utils/header_fun.dart';
import 'package:lailaty/feature/agree_pages/carInfo/data/models/captain_registration_documents_request_model.dart';
import 'package:lailaty/feature/agree_pages/carInfo/data/models/captain_registration_documents_response_message_model.dart';
import 'package:lailaty/feature/agree_pages/carInfo/data/models/car_brand_model.dart';
import 'package:lailaty/feature/agree_pages/carInfo/data/models/car_info_model.dart';
import 'package:lailaty/feature/agree_pages/carInfo/data/models/motor_info_model.dart';

abstract class AgreePagesRemoteDateSource {
  Future<List<CarBrandModel>> getBrandsCar();
  Future<Unit> addCar(CarInfoModel car, String param);
  Future<Unit> addMotor(MotorInfoModel motor, String param);
  Future<CaptainRegistrationDocumentsResponseModel> captainRegister(
      CaptainRegistrationDocumentsModel request);
}

class AgreePagesRemoteDateSourceImpl implements AgreePagesRemoteDateSource {
  final http.Client client;
  AgreePagesRemoteDateSourceImpl({required this.client});

  @override
  Future<Unit> addCar(CarInfoModel car, String param) async {
    try {
      print("before");
      final url = Uri.parse("${UrlManager.addVeicleUrl}/$param");

      var request = http.MultipartRequest("POST", url);

      // Add Headers
      final headers = await getHeader(true);
      request.headers.addAll(headers);

      //  Add Non-File Fields as Text
      request.fields["model_year"] = car.model_year;
      request.fields["car_brand_id"] = car.car_brand_id;
      request.fields["colore"] = car.colore;
      request.fields["is_modified"] = car.is_modified;
      request.fields["gear_type"] = car.gear_type;
      request.fields["license_plate"] = car.license_plate;
      request.fields["more_than_four_seats"] = car.more_than_four_seats;
      request.fields["original_car_brand_id"] = car.original_car_brand_id ?? "";

      //  Add Files (if they exist)
      await _addFileIfNotNull(request, "image_1", car.image_1);
      await _addFileIfNotNull(request, "image_2", car.image_2);
      await _addFileIfNotNull(request, "image_3", car.image_3);
      await _addFileIfNotNull(request, "image_4", car.image_4);
      await _addFileIfNotNull(request, "image_5", car.image_5);
      await _addFileIfNotNull(request, "face_1", car.face_1);
      await _addFileIfNotNull(request, "face_2", car.face_2);

      // Send Request
      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);
      print(jsonEncode(response.body));
      if (response.statusCode == 201) {
        print("201");

        return unit;
      } else {
        print("else");
        // مسؤولة عن التعامل مع الأخطاء التي ترجعها استجابة الـ API نفسها
        //. أي أنها تفحص كود الحالة (statusCode) الذي أرسله السيرفر وتقوم برمي ServerException عند حدوث أي خطأ.
        handleHttpExceptions(response);
      }
      // عالج الأخطاء المتعلقة بانقطاع الاتصال بالإنترنت أو تعذر الوصول إلى السيرفرj
    } on HttpException {
      throw ServerException(
          errorModel: ErrorModel(errorMessage: "خطأ في الاتصال بالخادم"));
    } catch (e) {
      throw ServerException(
          errorModel:
              ErrorModel(errorMessage: "حدث خطأ غير متوقع: ${e.toString()}"));
    }
    throw ServerException(
        errorModel: ErrorModel(errorMessage: "حدث خطأ غير متوقع"));
  }

  Future<void> _addFileIfNotNull(
      http.MultipartRequest request, String fieldName, File? file) async {
    if (file != null) {
      request.files.add(
        await http.MultipartFile.fromPath(
          fieldName,
          file.path,
        ),
      );
    }
  }

  @override
  Future<Unit> addMotor(MotorInfoModel motor, String param) {
    // TODO: implement addMotor
    throw UnimplementedError();
  }

  @override
  Future<List<CarBrandModel>> getBrandsCar() {
    // TODO: implement getBrandsCar
    throw UnimplementedError();
  }

  @override
  Future<CaptainRegistrationDocumentsResponseModel> captainRegister(
      CaptainRegistrationDocumentsModel request) async {
    final Uri url = Uri.parse(UrlManager.captianRegisterUrl);
    var requestBody = http.MultipartRequest('POST', url);
    final headers = await getHeader(true);
    requestBody.headers.addAll(headers);
    //  getHeader(true)!);
    requestBody.fields[ApiKeyManager.birthDate] = request.birthDate;
    requestBody.files.add(await http.MultipartFile.fromPath(
        ApiKeyManager.personalImage, request.personalImage.path));
    requestBody.files.add(await http.MultipartFile.fromPath(
        ApiKeyManager.driverLicenseFrontFace,
        request.driverLicenseFrontFace.path));
    requestBody.files.add(await http.MultipartFile.fromPath(
        ApiKeyManager.driverLicenseBackFace,
        request.driverLicenseBackFace.path));
    requestBody.files.add(await http.MultipartFile.fromPath(
        ApiKeyManager.personalCardFrontFace,
        request.personalCardFrontFace.path));
    requestBody.files.add(await http.MultipartFile.fromPath(
        ApiKeyManager.personalCardBackFace, request.personalCardBackFace.path));
    //the optional file :
    if (request.criminalRecord != null) {
      requestBody.files.add(await http.MultipartFile.fromPath(
          ApiKeyManager.criminalRecord, request.criminalRecord!.path));
    }

    try {
      final streamedResponse = await requestBody.send();
      final response = await http.Response.fromStream(streamedResponse);
      print("response body " + jsonEncode(response.body));
      print(response.statusCode);
      //    handleHttpExceptions(response);
      if (response.statusCode == 200) {
        final decodedJson = json.decode(response.body);
        return CaptainRegistrationDocumentsResponseModel.fromJson(decodedJson);
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
