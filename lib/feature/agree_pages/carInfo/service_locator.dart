import 'package:lailaty/core/config/storage/service_locator.dart';
import 'package:lailaty/feature/agree_pages/carInfo/data/data_source/remote_data_source.dart';
import 'package:lailaty/feature/agree_pages/carInfo/data/repo/agree_pages_repo_impl.dart';
import 'package:lailaty/feature/agree_pages/carInfo/domain/repositories/agree_page_repository.dart';
import 'package:lailaty/feature/agree_pages/carInfo/domain/use_case/captain_registration_usecase.dart';
import 'package:lailaty/feature/agree_pages/carInfo/presentation/state_managment/captain_register_bloc/captain_register_bloc.dart';

// final sl = GetIt.instance;

Future<void> initCaptainRegisterFeature() async {
  // -----------------------Bloc------------------------------
  sl.registerFactory(() => CaptainRegisterBloc(captainRegisterUseCase: sl()));

  // -----------------------Use Case---------------------------
  sl.registerLazySingleton(() => CaptainRegistrationUsecase(repo: sl()));

  // ----------------------Repository----------------------------
  sl.registerLazySingleton<AgreePageRepository>(
    () => AgreePagesRepoImpl(
      agreePagesRemoteDateSource: sl(),
      networkInfo: sl(),
    ),
  );

  // -----------------------Data sources-------------------------
  sl.registerLazySingleton<AgreePagesRemoteDateSource>(
    () => AgreePagesRemoteDateSourceImpl(
        client: sl()),
  );
}
