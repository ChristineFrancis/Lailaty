// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:lailaty/core/error_manager/failures.dart';
import 'package:lailaty/feature/agree_pages/carInfo/domain/entities/car_veicle_entity.dart';
import 'package:lailaty/feature/agree_pages/carInfo/domain/entities/motor_viecle_entity.dart';
import 'package:lailaty/feature/agree_pages/carInfo/domain/repositories/agree_page_repository.dart';

class AddCarUsecase {
  AgreePageRepository repo;
  AddCarUsecase({
    required this.repo,
  });
    Future<Either<Failure, Unit>> call(CarViecleEntity addCarInfo,String paramter) async {
    return await repo.addCar(addCarInfo,paramter);
  }
}
