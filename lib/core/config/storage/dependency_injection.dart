import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import '../../../common features/authentication/data/data_sources/auth_remote_data_source.dart';
import '../../../common features/authentication/data/repositories/auth_repository_impl.dart';
import '../../../common features/authentication/domain/repositories/auth_repository.dart';
import '../../../common features/authentication/domain/use_cases/register.dart';
import '../../../common features/authentication/domain/use_cases/resend_verification_code.dart';
import '../../../common features/authentication/domain/use_cases/verify_email.dart';
import '../../../common features/authentication/presentation/bloc/register_bloc/register_bloc.dart';
import '../../../common features/authentication/presentation/bloc/verify_email_bloc/verify_email_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Bloc
  sl.registerFactory(() => RegisterBloc(registerUseCase: sl()));
  sl.registerFactory(() => VerifyEmailBloc(
        verifyEmailUseCase: sl(),
        resendVerificationCodeUseCase: sl(),
      ));

  // Use cases
  sl.registerLazySingleton(() => Register(repository: sl()));
  sl.registerLazySingleton(() => VerifyEmail(repository: sl()));
  sl.registerLazySingleton(() => ResendVerificationCode(repository: sl()));

  // Repository
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(remoteDataSource: sl()),
  );

  // Data sources
  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(client: sl()),
  );

  // External
  sl.registerLazySingleton(() => http.Client());
}
