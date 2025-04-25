
// final sl = GetIt.instance;

// Future<void> initAuthFeature() async {
//   //! -----------------------Bloc------------------------------
//   sl.registerFactory(() => RegisterBloc(registerUseCase: sl()));
//   sl.registerFactory(() => VerifyEmailBloc(
//         verifyEmailUseCase: sl(),
//         resendVerificationCodeUseCase: sl(),
//       ));
//   sl.registerFactory(() => LoginBloc(loginUseCase: sl()));
//   sl.registerFactory(() => ForgotPasswordBloc(forgotPasswordUseCase: sl()));

//   //! -----------------------Use Cases---------------------------
//   sl.registerLazySingleton(() => Register(repository: sl()));
//   sl.registerLazySingleton(() => VerifyEmail(repository: sl()));
//   sl.registerLazySingleton(() => ResendVerificationCode(repository: sl()));
//   sl.registerLazySingleton(() => Login(repository: sl()));
//   sl.registerLazySingleton(() => ForgotPassword(repository: sl()));

//   //! ----------------------Repository----------------------------
//   sl.registerLazySingleton<AuthRepository>(
//     () => AuthRepositoryImpl(remoteDataSource: sl()),
//   );

//   //! -----------------------Data sources-------------------------
//   sl.registerLazySingleton<AuthRemoteDataSource>(
//     () => AuthRemoteDataSourceImpl(client: sl()),
//   );

//   //! -------------------------External---------------------------
//   //sl.registerLazySingleton(() => sl());
// }

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:lailaty/core/config/storage/service_locator.dart';
import 'package:lailaty/core/config/storage/secure_storage_service.dart';
import 'package:lailaty/feature/authentication/data/data_sources/auth_remote_data_source.dart';
import 'package:lailaty/feature/authentication/data/repositories/auth_repository_impl.dart';
import 'package:lailaty/feature/authentication/domain/repositories/auth_repository.dart';
import 'package:lailaty/feature/authentication/domain/use_cases/forgot_password.dart';
import 'package:lailaty/feature/authentication/domain/use_cases/information_register.dart';
import 'package:lailaty/feature/authentication/domain/use_cases/login.dart';
import 'package:lailaty/feature/authentication/domain/use_cases/logout.dart';
import 'package:lailaty/feature/authentication/domain/use_cases/register.dart';
import 'package:lailaty/feature/authentication/domain/use_cases/resend_verification_code.dart';
import 'package:lailaty/feature/authentication/domain/use_cases/verify_email.dart';
import 'package:lailaty/feature/authentication/presentation/bloc/forgot_password_bloc/forgot_password_bloc.dart';
import 'package:lailaty/feature/authentication/presentation/bloc/information_register_bloc/information_register_bloc.dart';
import 'package:lailaty/feature/authentication/presentation/bloc/login_bloc/login_bloc.dart';
import 'package:lailaty/feature/authentication/presentation/bloc/logout_bloc/logout_bloc.dart';
import 'package:lailaty/feature/authentication/presentation/bloc/register_bloc/register_bloc.dart';
import 'package:lailaty/feature/authentication/presentation/bloc/verify_email_bloc/verify_email_bloc.dart';

Future<void> initAuthFeature() async {
  //! -----------------------Bloc------------------------------
  sl.registerFactory(() => RegisterBloc(registerUseCase: sl()));
  sl.registerFactory(() => VerifyEmailBloc(
        verifyEmailUseCase: sl(),
        resendVerificationCodeUseCase: sl(),
      ));
  sl.registerFactory(() => LoginBloc(loginUseCase: sl()));
  sl.registerFactory(() => ForgotPasswordBloc(forgotPasswordUseCase: sl()));
  sl.registerFactory(() => LogoutBloc(logoutUseCase: sl()));
  sl.registerFactory(
      () => InformationRegisterBloc(informationRegisterUseCase: sl()));

  //! -----------------------Use Cases---------------------------
  sl.registerLazySingleton(() => Register(repository: sl()));
  sl.registerLazySingleton(() => VerifyEmail(repository: sl()));
  sl.registerLazySingleton(() => ResendVerificationCode(repository: sl()));
  sl.registerLazySingleton(() => Login(repository: sl()));
  sl.registerLazySingleton(() => ForgotPassword(repository: sl()));
  sl.registerLazySingleton(() => Logout(repository: sl()));
  sl.registerLazySingleton(() => InformationRegister(repository: sl()));

  //! ----------------------Repository----------------------------
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      remoteDataSource: sl(),
      secureStorageService: sl(),
    ),
  );

  //! -----------------------Data sources-------------------------
  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(client: sl()),
  );

  //!-----------------Flutter secure storage----------------------
  final secureStorage = FlutterSecureStorage();
  sl.registerLazySingleton<FlutterSecureStorage>(() => secureStorage);
  sl.registerLazySingleton<SecureStorageService>(
      () => SecureStorageService(secureStorage: sl()));

  //! -------------------------External---------------------------
//  sl.registerLazySingleton(() => http.Client());
}
