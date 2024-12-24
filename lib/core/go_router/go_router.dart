import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:lailaty/core/resources/key_manager.dart';
import 'package:lailaty/feature/agreeScreens/presentation/state_managment/birthdate_view_model.dart';
import 'package:lailaty/feature/agreeScreens/presentation/state_managment/personal_information_view.dart';
import 'package:lailaty/feature/agreeScreens/presentation/view/carInfo.dart';
import 'package:lailaty/feature/agreeScreens/presentation/view/login_prompt_page.dart';
import 'package:lailaty/feature/agreeScreens/presentation/view/personal_information_page.dart';
import 'package:lailaty/feature/agreeScreens/presentation/view/security_information_page.dart';
import 'package:lailaty/feature/travel/presentation/view/travel_page.dart';
import 'package:provider/provider.dart';

class Routes {
  static String carInfoPath = "/";

  GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: carInfoPath,
        builder: (context, state) => const CarInfoView(),
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
          child: ChangeNotifierProvider(
            create: (context) => PersonalInformationView(),
            child: const SecurityInformationPage(),
          ),
          transitionsBuilder: _fadeTransition,
        ),
      ),
      GoRoute(
        path: AppKeys.loginPromptPageKey,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const LoginPromptPage(),
          transitionsBuilder: _fadeTransition,
        ),
      ),
      GoRoute(
        path: AppKeys.travelPageKey,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const TravelPage(),
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
