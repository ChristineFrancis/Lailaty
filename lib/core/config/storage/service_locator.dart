import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:lailaty/core/config/storage/dependency_injection.dart';
import 'package:lailaty/core/network/network_connection.dart';
import 'package:lailaty/feature/agree_pages/carInfo/service_locator.dart';
import 'package:http/http.dart' as http;
import 'package:lailaty/feature/fleet/service_locator.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
// -------------------------External---------------------------
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImplement(
        isConnect: InternetConnectionChecker.createInstance(),
      ));
// -------------------------Feature Modules---------------------------
  await initAuthFeature();
  await initCaptainRegisterFeature();
  await initFleetFeature();
}
