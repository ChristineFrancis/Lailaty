import 'package:lailaty/core/config/storage/service_locator.dart';
import 'package:lailaty/feature/authentication/data/data_sources/auth_remote_data_source.dart';
import 'package:lailaty/feature/authentication/data/repositories/auth_repository_impl.dart';
import 'package:lailaty/feature/authentication/domain/repositories/auth_repository.dart';
import 'package:lailaty/feature/authentication/domain/use_cases/forgot_password.dart';
import 'package:lailaty/feature/authentication/domain/use_cases/login.dart';
import 'package:lailaty/feature/authentication/domain/use_cases/register.dart';
import 'package:lailaty/feature/authentication/domain/use_cases/resend_verification_code.dart';
import 'package:lailaty/feature/authentication/domain/use_cases/verify_email.dart';
import 'package:lailaty/feature/authentication/presentation/bloc/forgot_password_bloc/forgot_password_bloc.dart';
import 'package:lailaty/feature/authentication/presentation/bloc/login_bloc/login_bloc.dart';
import 'package:lailaty/feature/authentication/presentation/bloc/register_bloc/register_bloc.dart';
import 'package:lailaty/feature/authentication/presentation/bloc/verify_email_bloc/verify_email_bloc.dart';

// final sl = GetIt.instance;

Future<void> initAuthFeature() async {
  //! -----------------------Bloc------------------------------
  sl.registerFactory(() => RegisterBloc(registerUseCase: sl()));
  sl.registerFactory(() => VerifyEmailBloc(
        verifyEmailUseCase: sl(),
        resendVerificationCodeUseCase: sl(),
      ));
  sl.registerFactory(() => LoginBloc(loginUseCase: sl()));
  sl.registerFactory(() => ForgotPasswordBloc(forgotPasswordUseCase: sl()));

  //! -----------------------Use Cases---------------------------
  sl.registerLazySingleton(() => Register(repository: sl()));
  sl.registerLazySingleton(() => VerifyEmail(repository: sl()));
  sl.registerLazySingleton(() => ResendVerificationCode(repository: sl()));
  sl.registerLazySingleton(() => Login(repository: sl()));
  sl.registerLazySingleton(() => ForgotPassword(repository: sl()));

  //! ----------------------Repository----------------------------
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(remoteDataSource: sl()),
  );

  //! -----------------------Data sources-------------------------
  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(client: sl()),
  );

  //! -------------------------External---------------------------
  //sl.registerLazySingleton(() => sl());
}
