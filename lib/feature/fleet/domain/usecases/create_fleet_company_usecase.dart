// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:lailaty/core/error_manager/failures.dart';
import 'package:lailaty/feature/fleet/domain/entities/company_fleet/fleet_create_company_request_entity.dart';
import 'package:lailaty/feature/fleet/domain/entities/company_fleet/fleet_create_company_response_entity.dart';
import 'package:lailaty/feature/fleet/domain/repo/fleet_repo.dart';

class CreateFleetCompanyUsecase {
  FleetRepo repo;
  CreateFleetCompanyUsecase({
    required this.repo,
  });
  Future<Either<Failure, FleetCreateCompanyResponseEntity>> call(
      FleetCreateCompanyRequestEntity fleetCompany) async {
    return await repo.createFleetCompany(fleetCompany);
  }
}
