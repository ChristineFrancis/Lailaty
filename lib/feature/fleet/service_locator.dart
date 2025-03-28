import 'package:lailaty/core/config/storage/service_locator.dart';
import 'package:lailaty/feature/fleet/data/datasources/remote_fleet_datasource.dart';
import 'package:lailaty/feature/fleet/data/repo/fleet_repo_impl.dart';
import 'package:lailaty/feature/fleet/domain/repo/fleet_repo.dart';
import 'package:lailaty/feature/fleet/domain/usecases/create_fleet_company_usecase.dart';
import 'package:lailaty/feature/fleet/domain/usecases/create_personal_fleet_usecase.dart';
import 'package:lailaty/feature/fleet/presentation/state_manager/fleet_company/fleet_company_bloc.dart';
import 'package:lailaty/feature/fleet/presentation/state_manager/personal_fleet/personal_fleet_bloc.dart';

Future<void> initFleetFeature() async {
  // -----------------------Data Sources-------------------------
  sl.registerLazySingleton<RemoteFleetDatasource>(
    () => RemoteFleetDatasourceImpl(client: sl()),
  );

  // ----------------------Repository----------------------------
  sl.registerLazySingleton<FleetRepo>(
    () => FleetRepoImpl(
      remoteFleetDatasource: sl(),
      networkInfo: sl(),
    ),
  );

  // -----------------------Use Cases---------------------------
  sl.registerLazySingleton(
    () => CreateFleetCompanyUsecase(repo: sl()),
  );
  sl.registerLazySingleton(
    () => CreatePersonalFleetUsecase(repo: sl()),
  );

  // -----------------------Bloc------------------------------
  sl.registerFactory(
    () => FleetCompanyBloc(fleetCompanyUsecase: sl()),
  );
  sl.registerFactory(
    () => PersonalFleetBloc(sl()),
  );
}
