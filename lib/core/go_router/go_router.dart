import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:lailaty/core/resources/key_manager.dart';
import 'package:lailaty/feature/agreeScreens/presentation/state_managment/birthdate_view_model.dart';
import 'package:lailaty/feature/agreeScreens/presentation/state_managment/personal_information_view.dart';
import 'package:lailaty/feature/agreeScreens/presentation/view/carInfo.dart';
import 'package:lailaty/feature/agreeScreens/presentation/view/motor_info.dart';
import 'package:lailaty/feature/chooseCategoryScreens/presentation/view/categoryView.dart';

import '../../feature/agreeScreens/presentation/view/noticeToDriverView.dart';
import 'package:lailaty/feature/agreeScreens/presentation/view/personal_information_page.dart';
import 'package:lailaty/feature/agreeScreens/presentation/view/security_information_page.dart';
import 'package:provider/provider.dart';

class Routes {
  static String carInfoPath = "/";
  static String motorInfoPath = "/MotorInfoView";
  static String showCategoryPath = "/CategoryView";
  static String noticeToDriverPath = "/NoticeToDriverView";

  GoRouter router = GoRouter(
    routes: [    GoRoute(
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
      GoRoute(
        path: AppKeys.personalInformationPageKey,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: MultiProvider(
            providers: [
              ChangeNotifierProvider(
                create: (_) => PersonalInformationView(),
              ),
              ChangeNotifierProvider(
                create: (_) => BirthdateviewModel(),
              ),
            ],
            child: const PersonalInformationPage(),
          ),
          transitionsBuilder: _fadeTransition,
        ),
      ),
      GoRoute(
        path: AppKeys.securityInformationPageKey,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const SecurityInformationPage(),
          transitionsBuilder: _fadeTransition,
        ),
      ),
    ],
  );

  static Widget _fadeTransition(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    const curve = Curves.easeInOut;
    var fadeTween = Tween(begin: 0.0, end: 1.0).chain(CurveTween(curve: curve));

    return FadeTransition(
      opacity: animation.drive(fadeTween),
      child: child,
    );
  }
}
