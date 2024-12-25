import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:lailaty/core/resources/key_manager.dart';
import 'package:lailaty/feature/agreeScreens/presentation/state_managment/birthdate_view_model.dart';
import 'package:lailaty/feature/agreeScreens/presentation/state_managment/personal_information_view.dart';
import 'package:lailaty/feature/agreeScreens/presentation/view/carInfo.dart';
import 'package:lailaty/feature/agreeScreens/presentation/view/editingCar.dart';
import 'package:lailaty/feature/agreeScreens/presentation/view/motor_info.dart';
import 'package:lailaty/feature/chooseCategoryScreens/presentation/view/categoryView.dart';

import '../../feature/agreeScreens/presentation/view/noticeToDriverView.dart';
import 'package:lailaty/feature/agreeScreens/presentation/view/personal_information_page.dart';
import 'package:lailaty/feature/agreeScreens/presentation/view/security_information_page.dart';
import 'package:provider/provider.dart';

class Routes {
  GoRouter router = GoRouter(
    routes: [
      // GoRoute(
      //   path:" ${AppKeys.carInfoPath}/:sectionId",
      //   builder: (context, state) {
      //     final sectionId = state.pathParameters['sectionId']!;
      //     return CarInfoView(
      //       viewModel: context.read<PersonalInformationView>(),
      //       sectionId: sectionId,
      //     );
      //   },
      // ),
      GoRoute(
        path: AppKeys.carInfoPath,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: ChangeNotifierProvider(
            create: (context) => PersonalInformationView(),
            child: const CarInfoView(),
          ),
          transitionsBuilder: _fadeTransition,
        ),
      ),
      GoRoute(
        path: AppKeys.editingCarPage,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const EditingCar(),
          transitionsBuilder: _fadeTransition,
        ),
      ),
      GoRoute(
        path: AppKeys.motorInfoPath,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const MotorInfoView(),
          transitionsBuilder: _fadeTransition,
        ),
      ),
      GoRoute(
        path: AppKeys.noticeToDriverPath,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const NoticeToDriverView(),
          transitionsBuilder: _fadeTransition,
        ),
      ),
      GoRoute(
        path: AppKeys.showCategoryPath,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const CategoryView(),
          transitionsBuilder: _fadeTransition,
        ),
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
