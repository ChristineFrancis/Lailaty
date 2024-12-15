

import 'package:go_router/go_router.dart';
import 'package:lailaty/feature/agreeScreens/presentation/view/carInfo.dart';

class Routes {
  static String carInfoPath = "/";

  GoRouter router = GoRouter(routes: [
    GoRoute(
      path: carInfoPath,
      builder: (context, state) => const CarInfoView(),
    ),
   
  ]);
}
