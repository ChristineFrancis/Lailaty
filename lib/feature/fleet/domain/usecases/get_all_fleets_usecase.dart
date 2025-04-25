import 'package:dartz/dartz.dart';
import 'package:lailaty/feature/fleet/domain/entities/fleet_to_join/fleets_entity.dart';
import 'package:lailaty/feature/fleet/domain/repo/fleet_repo.dart';
import '../../../../core/error_manager/failures.dart';

class GetAllFleetsUsecase {
  FleetRepo repo;
  GetAllFleetsUsecase({
    required this.repo,
  });
  Future<Either<Failure, List<GetAllFleetEntity>>> call() async {
    return await repo.getAllFleets();
  }
}
