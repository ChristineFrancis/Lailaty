import 'package:dartz/dartz.dart';
import 'package:lailaty/core/error_manager/exception.dart';
import 'package:lailaty/core/error_manager/failures.dart';
import 'package:lailaty/core/network/network_connection.dart';
import 'package:lailaty/core/resources/string_manager.dart';
import 'package:lailaty/feature/fleet/data/datasources/remote_fleet_datasource.dart';
import 'package:lailaty/feature/fleet/data/models/fleet_company_models/fleet_create_company_request_model.dart';
import 'package:lailaty/feature/fleet/data/models/personal_fleet_models/create_personal_fleet_request.dart';
import 'package:lailaty/feature/fleet/domain/entities/company_fleet/fleet_create_company_request_entity.dart';
import 'package:lailaty/feature/fleet/domain/entities/company_fleet/fleet_create_company_response_entity.dart';
import 'package:lailaty/feature/fleet/domain/entities/fleet_to_join/create_work_request_entity.dart';
import 'package:lailaty/feature/fleet/domain/entities/fleet_to_join/fleets_entity.dart';
import 'package:lailaty/feature/fleet/domain/entities/personal_fleet/fleet_create_person_request.dart';
import 'package:lailaty/feature/fleet/domain/entities/personal_fleet/fleet_create_person_response.dart';
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

  @override
  Future<Either<Failure, FleetCreatePersonalResponse>> createPersonalFleet(
      FleetCreatePersonRequest request) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await remoteFleetDatasource.createPersonalFleet(
          FleetCreatePersonRequestModel(
            name: request.name,
            phoneNumber: request.phoneNumber,
            latitude: request.latitude,
            longitude: request.longitude,
          ),
        );

        return Right(response.toEntity());
      } on ServerException catch (e) {
        return Left(ServerFailure(e.errorModel.errorMessage));
      }
    } else {
      print("No Internet Connection");
      return Left(NoConnectionFailure(StringManager.noInternetConnection));
    }
  }

  @override
  Future<Either<Failure, List<GetAllFleetEntity>>> getAllFleets() async {
    if (await networkInfo.isConnected) {
      try {
        final response = await remoteFleetDatasource.getAllFleets();

        // Convert list of models to list of entities
        final List<GetAllFleetEntity> entityList =
            response.map((model) => model.toEntity()).toList();

        return Right(entityList);
      } on ServerException catch (e) {
        return Left(ServerFailure(e.errorModel.errorMessage));
      }
    } else {
      print("No Internet Connection");
      return Left(NoConnectionFailure(StringManager.noInternetConnection));
    }
  }

  @override
  Future<Either<Failure, List<GetAllFleetEntity>>> getSearchedFleet(
      String parameter) async {
    if (await networkInfo.isConnected) {
      try {
        final response =
            await remoteFleetDatasource.getSearchedFleet(parameter);

        final List<GetAllFleetEntity> entityList =
            response.map((model) => model.toEntity()).toList();

        return Right(entityList);
      } on ServerException catch (e) {
        return Left(ServerFailure(e.errorModel.errorMessage));
      }
    } else {
      print("No Internet Connection");
      return Left(NoConnectionFailure(StringManager.noInternetConnection));
    }
  }

  @override
  Future<Either<Failure, CreateWorkRequestEntity>> createWorkRequest(
      int id) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await remoteFleetDatasource.createWorkRequest(id);

        final CreateWorkRequestEntity entity = response.toEntity();

        return Right(entity);
      } on ServerException catch (e) {
        return Left(ServerFailure(e.errorModel.errorMessage));
      }
    } else {
      print("No Internet Connection");
      return Left(NoConnectionFailure(StringManager.noInternetConnection));
    }
  }
}
