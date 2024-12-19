import 'package:go_router/go_router.dart';
import 'package:lailaty/feature/agreeScreens/presentation/view/carInfo.dart';
import 'package:lailaty/feature/agreeScreens/presentation/view/motor_info.dart';
import 'package:lailaty/feature/chooseCategoryScreens/presentation/view/categoryView.dart';

import '../../feature/agreeScreens/presentation/view/noticeToDriverView.dart';

class Routes {
  static String carInfoPath = "/";
  static String motorInfoPath = "/MotorInfoView";
  static String showCategoryPath = "/CategoryView";
  static String noticeToDriverPath = "/NoticeToDriverView";

  GoRouter router = GoRouter(routes: [
    GoRoute(
      path: carInfoPath,
      builder: (context, state) => const CarInfoView(),
    ),
    GoRoute(
      path: motorInfoPath,
      builder: (context, state) => const MotorInfoView(),
    ),
    GoRoute(
      path: noticeToDriverPath,
      builder: (context, state) => const NoticeToDriverView(),
    ),
    GoRoute(
      path: showCategoryPath,
      builder: (context, state) => const CategoryView(),
    ),
  ]);
}
