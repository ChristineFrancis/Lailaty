import 'package:dartz/dartz.dart';
import 'package:lailaty/core/error_manager/failures.dart';
import 'package:lailaty/feature/fleet/domain/entities/personal_fleet/fleet_create_person_request.dart';
import 'package:lailaty/feature/fleet/domain/entities/personal_fleet/fleet_create_person_response.dart';
import 'package:lailaty/feature/fleet/domain/repo/fleet_repo.dart';

class CreatePersonalFleetUsecase {
  FleetRepo repo;
  CreatePersonalFleetUsecase({
    required this.repo,
  });
  Future<Either<Failure, FleetCreatePersonalResponse>> call(FleetCreatePersonRequest perosnalFleet) async {
    return await repo.createPersonalFleet(perosnalFleet);
  }
}
