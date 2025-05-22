import 'package:dartz/dartz.dart';
import 'package:lailaty/core/error_manager/failures.dart';
import 'package:lailaty/feature/agree_pages/carInfo/domain/entities/car_registration_request_entity.dart';
import 'package:lailaty/feature/agree_pages/carInfo/domain/entities/vehicle_registration_response_entity.dart';
import 'package:lailaty/feature/agree_pages/carInfo/domain/repositories/agree_page_repository.dart';

class AddCarUsecase {
  AgreePageRepository repo;
  AddCarUsecase({
    required this.repo,
  });
    Future<Either<Failure, VehicleRegistrationResponse>> call(CarRegistrationRequest addCarInfo,String paramter) async {
    return await repo.addCar(addCarInfo,paramter);
  }
}
