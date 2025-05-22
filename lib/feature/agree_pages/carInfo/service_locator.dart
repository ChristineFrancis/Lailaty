import 'package:lailaty/core/config/storage/service_locator.dart';
import 'package:lailaty/feature/agree_pages/carInfo/data/data_source/remote_data_source.dart';
import 'package:lailaty/feature/agree_pages/carInfo/data/repo/agree_pages_repo_impl.dart';
import 'package:lailaty/feature/agree_pages/carInfo/domain/repositories/agree_page_repository.dart';
import 'package:lailaty/feature/agree_pages/carInfo/domain/use_case/add_car_usecase.dart';
import 'package:lailaty/feature/agree_pages/carInfo/domain/use_case/add_motor_usecase.dart';
import 'package:lailaty/feature/agree_pages/carInfo/domain/use_case/captain_registration_usecase.dart';
import 'package:lailaty/feature/agree_pages/carInfo/domain/use_case/get_all_brands.dart';
import 'package:lailaty/feature/agree_pages/carInfo/presentation/state_managment/add_car_bloc/add_veicle_bloc.dart';
import 'package:lailaty/feature/agree_pages/carInfo/presentation/state_managment/brands_car_bloc/get_brands_car_bloc.dart';
import 'package:lailaty/feature/agree_pages/carInfo/presentation/state_managment/captain_register_bloc/captain_register_bloc.dart';

// final sl = GetIt.instance;

Future<void> initCaptainRegisterFeature() async {
  // -----------------------Bloc------------------------------
  sl.registerFactory(() => CaptainRegisterBloc(captainRegisterUseCase: sl()));
  sl.registerFactory(() => AddVeicleBloc(addCarUsecase: sl(),addMotorUsecase: sl()));
  sl.registerFactory(() => GetBrandsCarBloc(getBrandsCarUseCase: sl()));
  // -----------------------Use Case---------------------------
  sl.registerLazySingleton(() => CaptainRegistrationUsecase(repo: sl()));
  sl.registerLazySingleton(() => AddCarUsecase(repo: sl()));
  sl.registerLazySingleton(() => GetAllBrandsUseCase(repo: sl()));
  sl.registerLazySingleton(() => AddMotorUsecase(repo: sl()));

  // ----------------------Repository----------------------------
  sl.registerLazySingleton<AgreePageRepository>(
    () => AgreePagesRepoImpl(
      agreePagesRemoteDateSource: sl(),
      networkInfo: sl(),
    ),
  );

  // -----------------------Data sources-------------------------
  sl.registerLazySingleton<AgreePagesRemoteDateSource>(
    () => AgreePagesRemoteDateSourceImpl(apiClient: sl()),
  );
}
