import 'package:dartz/dartz.dart';
import 'package:lailaty/core/error_manager/failures.dart';
import 'package:lailaty/feature/fleet/domain/entities/company_fleet/fleet_create_company_request_entity.dart';
import 'package:lailaty/feature/fleet/domain/entities/company_fleet/fleet_create_company_response_entity.dart';
import 'package:lailaty/feature/fleet/domain/entities/fleet_to_join/create_work_request_entity.dart';
import 'package:lailaty/feature/fleet/domain/entities/fleet_to_join/fleets_entity.dart';
import 'package:lailaty/feature/fleet/domain/entities/personal_fleet/fleet_create_person_request.dart';
import 'package:lailaty/feature/fleet/domain/entities/personal_fleet/fleet_create_person_response.dart';

abstract class FleetRepo {
  Future<Either<Failure, FleetCreateCompanyResponseEntity>> createFleetCompany(
      FleetCreateCompanyRequestEntity request);

  Future<Either<Failure, FleetCreatePersonalResponse>> createPersonalFleet(
      FleetCreatePersonRequest request);

  Future<Either<Failure, List<GetAllFleetEntity>>> getAllFleets();

  Future<Either<Failure, List<GetAllFleetEntity>>> getSearchedFleet(
      String parameter);

  Future<Either<Failure, CreateWorkRequestEntity>> createWorkRequest(int id);
}
