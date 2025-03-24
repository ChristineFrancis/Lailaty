import 'package:dartz/dartz.dart';
import 'package:lailaty/core/error_manager/failures.dart';
import 'package:lailaty/feature/fleet/domain/entities/fleet_create_company_request_entity.dart';
import 'package:lailaty/feature/fleet/domain/entities/fleet_create_company_response_entity.dart';

abstract class FleetRepo {
  Future<Either<Failure, FleetCreateCompanyResponseEntity>>
      createFleetCompany(FleetCreateCompanyRequestEntity request);
}
