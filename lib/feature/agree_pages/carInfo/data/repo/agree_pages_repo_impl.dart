import 'package:dartz/dartz.dart';
import 'package:lailaty/core/error_manager/exception.dart';
import 'package:lailaty/core/error_manager/failures.dart';
import 'package:lailaty/core/network/network_connection.dart';
import 'package:lailaty/core/resources/string_manager.dart';
import 'package:lailaty/feature/agree_pages/carInfo/data/data_source/remote_data_source.dart';
import 'package:lailaty/feature/agree_pages/carInfo/data/models/captain_registration_documents_request_model.dart';
import 'package:lailaty/feature/agree_pages/carInfo/data/models/car_registration_request_model.dart';
import 'package:lailaty/feature/agree_pages/carInfo/data/models/motorcycle_registration_request_model.dart';
import 'package:lailaty/feature/agree_pages/carInfo/domain/entities/brands_car_entity.dart';
import 'package:lailaty/feature/agree_pages/carInfo/domain/entities/captain_registration_documents_request.dart';
import 'package:lailaty/feature/agree_pages/carInfo/domain/entities/captain_registration_documents_response_message.dart';
import 'package:lailaty/feature/agree_pages/carInfo/domain/entities/car_registration_request_entity.dart';
import 'package:lailaty/feature/agree_pages/carInfo/domain/entities/motorcycle_registration_request_entity.dart';
import 'package:lailaty/feature/agree_pages/carInfo/domain/entities/vehicle_registration_response_entity.dart';
import 'package:lailaty/feature/agree_pages/carInfo/domain/repositories/agree_page_repository.dart';

class AgreePagesRepoImpl implements AgreePageRepository {
  AgreePagesRemoteDateSource agreePagesRemoteDateSource;
  NetworkInfo networkInfo;
  AgreePagesRepoImpl({
    required this.agreePagesRemoteDateSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, VehicleRegistrationResponse>> addCar(
      CarRegistrationRequest addCarInfo, String paramter) async {
    final carModel = CarRegistrationRequestModel(
      carBrandId: addCarInfo.carBrandId,
      color: addCarInfo.color,
      gearType: addCarInfo.gearType,
      isModified: addCarInfo.isModified,
      licensePlate: addCarInfo.licensePlate,
      modelYear: addCarInfo.modelYear,
      moreThanFourSeats: addCarInfo.moreThanFourSeats,
      originalCarBrandId: addCarInfo.originalCarBrandId,
      image1: addCarInfo.image1,
      image2: addCarInfo.image2,
      image3: addCarInfo.image3,
      image4: addCarInfo.image4,
      image5: addCarInfo.image5,
      face1: addCarInfo.face1,
      face2: addCarInfo.face2,
    );
    if (await networkInfo.isConnected) {
      print(carModel);
      try {
        final model =
            await agreePagesRemoteDateSource.addCar(carModel, paramter);
        VehicleRegistrationResponse response = model.toEntity();
        print("yes");
        return right(response);
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
  Future<Either<Failure, VehicleRegistrationResponse>> addMotor(
      MotorcycleRegistrationRequest addMotorInfo, String paramter) async {
    final motorModel = MotorcycleRegistrationRequestModel(
      modelYear: addMotorInfo.modelYear,
      licensePlate: addMotorInfo.licensePlate,
      image1: addMotorInfo.image1,
      face1: addMotorInfo.face1,
      face2: addMotorInfo.face2,
    );

    if (await networkInfo.isConnected) {
      print(motorModel);
      try {
        final model =
            await agreePagesRemoteDateSource.addMotor(motorModel, paramter);
        VehicleRegistrationResponse response = model.toEntity();
        print("✅ Motorcycle registration successful");
        return right(response);
      } on ServerException catch (e) {
        print("❌ Server error during motorcycle registration");
        return left(ServerFailure(e.errorModel.errorMessage));
      }
    } else {
      print("❌ No internet connection");
      return left(NoConnectionFailure("لا يوجد اتصال بالانترنت"));
    }
  }

  @override
  Future<Either<Failure, List<BrandsCarEntity>>> getCarBrands() async {
    if (await networkInfo.isConnected) {
      try {
        final response = await agreePagesRemoteDateSource.getBrandsCar();

        final List<BrandsCarEntity> brandsEntities =
            response.map((model) => model.toEntity()).toList();

        return Right(brandsEntities);
      } on ServerException catch (e) {
        return Left(ServerFailure(e.errorModel.errorMessage));
      }
    } else {
      print("❌ No internet connection");
      return Left(NoConnectionFailure(StringManager.noInternetConnection));
    }
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
