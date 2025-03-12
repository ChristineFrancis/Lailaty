// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:lailaty/core/error_manager/failures.dart';
import 'package:lailaty/feature/agree_pages/carInfo/domain/entities/brands_car_entity.dart';
import 'package:lailaty/feature/agree_pages/carInfo/domain/entities/motor_viecle_entity.dart';
import 'package:lailaty/feature/agree_pages/carInfo/domain/repositories/agree_page_repository.dart';

class AddMotorUsecase {
  AgreePageRepository repo;
  AddMotorUsecase({
    required this.repo,
  });
    Future<Either<Failure, List<BrandsCarEntity>>> call() async {
    return await repo.getCarBrands();
  }
}
