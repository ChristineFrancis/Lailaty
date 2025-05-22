import 'package:dartz/dartz.dart';
import 'package:lailaty/core/error_manager/failures.dart';
import 'package:lailaty/feature/agree_pages/carInfo/domain/entities/brands_car_entity.dart';
import 'package:lailaty/feature/agree_pages/carInfo/domain/entities/captain_registration_documents_request.dart';
import 'package:lailaty/feature/agree_pages/carInfo/domain/entities/captain_registration_documents_response_message.dart';
import 'package:lailaty/feature/agree_pages/carInfo/domain/entities/car_registration_request_entity.dart';
import 'package:lailaty/feature/agree_pages/carInfo/domain/entities/motorcycle_registration_request_entity.dart';
import 'package:lailaty/feature/agree_pages/carInfo/domain/entities/vehicle_registration_response_entity.dart';

abstract class AgreePageRepository {
  Future<Either<Failure, VehicleRegistrationResponse>> addCar(
      CarRegistrationRequest addCarInfo, String paramter);
  Future<Either<Failure, VehicleRegistrationResponse>> addMotor(
      MotorcycleRegistrationRequest addMotorInfo, String paramter);
  Future<Either<Failure, List<BrandsCarEntity>>> getCarBrands();
  Future<Either<Failure, CaptainRegistrationDocumentsResponseMessage>>
      captainRegister(CaptainRegistrationDocumentsRequest request);
}
