import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:lailaty/core/auth/auth_service.dart';
import 'package:lailaty/core/config/storage/dependency_injection.dart';
import 'package:lailaty/core/config/storage/secure_storage_service.dart';
import 'package:lailaty/core/network/network_connection.dart';
import 'package:lailaty/feature/agree_pages/carInfo/service_locator.dart';
import 'package:http/http.dart' as http;
import 'package:lailaty/feature/fleet/service_locator.dart';

// final sl = GetIt.instance;

// Future<void> initDependencies() async {
//   sl.registerLazySingleton(() => http.Client());

//   // Core Services (Register these BEFORE AuthService)
//   final secureStorage = FlutterSecureStorage();
//   sl.registerLazySingleton<FlutterSecureStorage>(() => secureStorage);
//   sl.registerLazySingleton<SecureStorageService>(
//       () => SecureStorageService(secureStorage: sl()));

//   // TEMPORARY placeholder for AuthTokenHandler (register real one after AuthService)
//   sl.registerLazySingleton<AuthTokenHandler>(() => throw UnimplementedError());

//   // TokenInterceptor depends on SecureStorage + AuthTokenHandler (replace it later)
//   sl.registerLazySingleton<TokenInterceptor>(() => TokenInterceptor(
//         storage: sl(),
//         authHandler: sl<AuthTokenHandler>(), // will be replaced below
//       ));

//   sl.registerLazySingleton<ApiClient>(() => ApiClient(
//         interceptor: sl(),
//         client: sl(),
//       ));

//   // Now that ApiClient is ready, register AuthService
//   final authService = AuthService(
//     storage: sl(),
//     apiClient: sl(),
//   );
//   sl.unregister<AuthTokenHandler>();
//   sl.registerLazySingleton<AuthService>(() => authService);
//   sl.registerLazySingleton<AuthTokenHandler>(() => authService);

//   // Register Network Info if needed
//   sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImplement(
//         isConnect: InternetConnectionChecker.createInstance(),
//       ));

// // -------------------------External---------------------------
//   // sl.registerLazySingleton(() => http.Client());
//   // sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImplement(
//   //       isConnect: InternetConnectionChecker.createInstance(),
//   //     ));
// // -------------------------Feature Modules---------------------------
//   await initAuthFeature();
//   await initCaptainRegisterFeature();
//   await initFleetFeature();

//   // ------------------------- Core Services ---------------------------
//   // Secure Storage

//   // final secureStorage = FlutterSecureStorage();
//   // sl.registerLazySingleton<FlutterSecureStorage>(() => secureStorage);
//   // sl.registerLazySingleton<SecureStorageService>(
//   //     () => SecureStorageService(secureStorage: sl()));

//   // // sl.registerLazySingleton<SecureStorageService>(() => SecureStorageService(
//   // //       secureStorage: sl(),
//   // //     ));

//   // sl.registerLazySingleton<AuthTokenHandler>(() => sl<AuthService>());

//   // // API Client and Interceptor
//   // sl.registerLazySingleton<TokenInterceptor>(
//   //   () => TokenInterceptor(
//   //     storage: sl(),
//   //     authHandler: sl<AuthTokenHandler>(),
//   //   ),
//   // );

//   // sl.registerLazySingleton<ApiClient>(
//   //   () => ApiClient(
//   //     interceptor: sl(),
//   //     client: sl(), // http.Client
//   //   ),
//   // );

//   // // Auth Service
//   // sl.registerLazySingleton<AuthService>(
//   //   () => AuthService(
//   //     storage: sl(),
//   //     apiClient: sl(),
//   //   ),
//   // );
// }

final sl = GetIt.instance;

Future<void> initDependencies() async {
  sl.registerLazySingleton(() => http.Client());

  final secureStorage = FlutterSecureStorage();
  sl.registerLazySingleton<FlutterSecureStorage>(() => secureStorage);
  sl.registerLazySingleton<SecureStorageService>(
      () => SecureStorageService(secureStorage: sl()));

  // Create ProxyAuthTokenHandler and register it early
  final proxyHandler = ProxyAuthTokenHandler();
  sl.registerSingleton<AuthTokenHandler>(proxyHandler);

  //  Register TokenInterceptor with proxy instead of real AuthService
  sl.registerLazySingleton<TokenInterceptor>(() => TokenInterceptor(
        storage: sl(),
        authHandler: sl<AuthTokenHandler>(), // <- Proxy
      ));

  //  can create ApiClient
  sl.registerLazySingleton<ApiClient>(() => ApiClient(
        interceptor: sl(),
        client: sl(),
      ));

  //can safely create AuthService
  final authService = AuthService(
    storage: sl(),
    apiClient: sl(),
  );

  //Bind AuthService to proxy
  proxyHandler.bind(authService);

  // Register AuthService
  sl.registerSingleton<AuthService>(authService);

  // Additional services
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImplement(
        isConnect: InternetConnectionChecker.createInstance(),
      ));

  await initAuthFeature();
  await initCaptainRegisterFeature();
  await initFleetFeature();
}
