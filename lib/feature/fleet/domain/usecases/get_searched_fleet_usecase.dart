import 'package:dartz/dartz.dart';
import 'package:lailaty/core/error_manager/failures.dart';
import 'package:lailaty/feature/fleet/domain/entities/fleet_to_join/fleets_entity.dart';
import 'package:lailaty/feature/fleet/domain/repo/fleet_repo.dart';

class GetSearchedFleetUsecase {
  final FleetRepo repo;

  GetSearchedFleetUsecase({required this.repo});

  Future<Either<Failure, List<GetAllFleetEntity>>> call(String parameter) {
    return repo.getSearchedFleet(parameter);
  }
}
