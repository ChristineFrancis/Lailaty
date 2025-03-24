// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:lailaty/core/error_manager/exception.dart';
import 'package:lailaty/core/error_manager/failures.dart';
import 'package:lailaty/core/network/network_connection.dart';
import 'package:lailaty/core/resources/string_manager.dart';
import 'package:lailaty/feature/agree_pages/carInfo/data/data_source/remote_data_source.dart';
import 'package:lailaty/feature/agree_pages/carInfo/data/models/captain_registration_documents_request_model.dart';
import 'package:lailaty/feature/agree_pages/carInfo/data/models/car_info_model.dart';
import 'package:lailaty/feature/agree_pages/carInfo/domain/entities/brands_car_entity.dart';
import 'package:lailaty/feature/agree_pages/carInfo/domain/entities/captain_registration_documents_request.dart';
import 'package:lailaty/feature/agree_pages/carInfo/domain/entities/captain_registration_documents_response_message.dart';
import 'package:lailaty/feature/agree_pages/carInfo/domain/entities/car_veicle_entity.dart';
import 'package:lailaty/feature/agree_pages/carInfo/domain/entities/motor_viecle_entity.dart';
import 'package:lailaty/feature/agree_pages/carInfo/domain/repositories/agree_page_repository.dart';

class AgreePagesRepoImpl implements AgreePageRepository {
  AgreePagesRemoteDateSource agreePagesRemoteDateSource;
  NetworkInfo networkInfo;
  AgreePagesRepoImpl({
    required this.agreePagesRemoteDateSource,
    required this.networkInfo,
  });
  @override
  Future<Either<Failure, Unit>> addCar(
      CarViecleEntity addCarInfo, String paramter) async {
    final carModel = CarInfoModel(
        car_brand_id: addCarInfo.car_brand_id,
        colore: addCarInfo.colore,
        gear_type: addCarInfo.gear_type,
        is_modified: addCarInfo.is_modified,
        license_plate: addCarInfo.license_plate,
        model_year: addCarInfo.model_year,
        more_than_four_seats: addCarInfo.more_than_four_seats,
        original_car_brand_id: addCarInfo.original_car_brand_id,
        image_1: addCarInfo.image_1,
        image_2: addCarInfo.image_2,
        image_3: addCarInfo.image_3,
        image_4: addCarInfo.image_4,
        image_5: addCarInfo.image_5,
        face_1: addCarInfo.face_1,
        face_2: addCarInfo.face_2);
    if (await networkInfo.isConnected) {
      print(carModel);
      try {
        await agreePagesRemoteDateSource.addCar(carModel, paramter);
        print("yes");
        return right(unit);
      } on ServerException catch (e) {
        print("no");
        return left(ServerFailure(e.errorModel.errorMessage));
      }
    } else {
      print("no connection");
      return left(NoConnectionFailure("لا يوجد اتصال بالانترنت"));
    }
  }

  @override
  Future<Either<Failure, Unit>> addMotor(
      MotorInfoBaseEntity addMotorInfo, String paramter) {
    // TODO: implement addMotor
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<BrandsCarEntity>>> getCarBrands() {
    // TODO: implement getCarBrands
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, CaptainRegistrationDocumentsResponseMessage>>
      captainRegister(CaptainRegistrationDocumentsRequest request) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await agreePagesRemoteDateSource
            .captainRegister(CaptainRegistrationDocumentsModel(
          personalImage: request.personalImage,
          driverLicenseFrontFace: request.driverLicenseFrontFace,
          driverLicenseBackFace: request.driverLicenseBackFace,
          personalCardFrontFace: request.personalCardFrontFace,
          personalCardBackFace: request.personalCardBackFace,
          birthDate: request.birthDate,
        ));
        return Right(response);
      } on ServerException catch (e) {
        return Left(ServerFailure(e.errorModel.errorMessage));
      }
    } else {
      print("no connection");
      return left(NoConnectionFailure(StringManager.noInternetConnection));
    }
  }
}
