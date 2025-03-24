import 'package:dartz/dartz.dart';
import 'package:lailaty/core/error_manager/exception.dart';
import 'package:lailaty/core/error_manager/failures.dart';
import 'package:lailaty/core/network/network_connection.dart';
import 'package:lailaty/core/resources/string_manager.dart';
import 'package:lailaty/feature/fleet/data/datasources/remote_fleet_datasource.dart';
import 'package:lailaty/feature/fleet/data/models/fleet_create_company_request_model.dart';
import 'package:lailaty/feature/fleet/domain/entities/fleet_create_company_request_entity.dart';
import 'package:lailaty/feature/fleet/domain/entities/fleet_create_company_response_entity.dart';
import 'package:lailaty/feature/fleet/domain/repo/fleet_repo.dart';

class FleetRepoImpl implements FleetRepo {
  RemoteFleetDatasource remoteFleetDatasource;
  NetworkInfo networkInfo;
  FleetRepoImpl({
    required this.remoteFleetDatasource,
    required this.networkInfo,
  });
  @override
  Future<Either<Failure, FleetCreateCompanyResponseEntity>> createFleetCompany(
      FleetCreateCompanyRequestEntity request) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await remoteFleetDatasource
            .createFleetCompany(FleetCreateCompanyRequestModel(
          name: request.name,
          phoneNumber: request.phoneNumber,
          latitude: request.latitude,
          longitude: request.longitude,
          commercialRegistrationCard: request.commercialRegistrationCard,
          taxCard: request.taxCard,
        ));

        return Right(response.toEntity());
      } on ServerException catch (e) {
        return Left(ServerFailure(e.errorModel.errorMessage));
      }
    } else {
      print("No Internet Connection");
      return Left(NoConnectionFailure(StringManager.noInternetConnection));
    }
  }
}
