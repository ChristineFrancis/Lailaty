import 'package:dartz/dartz.dart';
import 'package:lailaty/core/error_manager/failures.dart';
import 'package:lailaty/feature/fleet/domain/entities/fleet_to_join/create_work_request_entity.dart';
import 'package:lailaty/feature/fleet/domain/repo/fleet_repo.dart';

class CreateWorkRequestUsecase {
  final FleetRepo repo;

  CreateWorkRequestUsecase({required this.repo});

  Future<Either<Failure, CreateWorkRequestEntity>> call(int officeId) async {
    return await repo.createWorkRequest(officeId);
  }
}
