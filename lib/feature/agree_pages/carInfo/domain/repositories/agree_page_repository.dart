import 'package:dartz/dartz.dart';
import 'package:lailaty/core/error_manager/failures.dart';
import 'package:lailaty/feature/agree_pages/carInfo/domain/entities/brands_car_entity.dart';
import 'package:lailaty/feature/agree_pages/carInfo/domain/entities/captain_registration_documents_request.dart';
import 'package:lailaty/feature/agree_pages/carInfo/domain/entities/captain_registration_documents_response_message.dart';
import 'package:lailaty/feature/agree_pages/carInfo/domain/entities/car_veicle_entity.dart';
import 'package:lailaty/feature/agree_pages/carInfo/domain/entities/motor_viecle_entity.dart';

abstract class AgreePageRepository {
  Future<Either<Failure, Unit>> addCar(
      CarViecleEntity addCarInfo, String paramter);
  Future<Either<Failure, Unit>> addMotor(
      MotorInfoBaseEntity addMotorInfo, String paramter);
  Future<Either<Failure, List<BrandsCarEntity>>> getCarBrands();
  Future<Either<Failure, CaptainRegistrationDocumentsResponseMessage>>
      captainRegister(CaptainRegistrationDocumentsRequest request);
}
