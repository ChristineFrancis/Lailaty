import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:lailaty/core/resources/key_manager.dart';
import 'package:lailaty/feature/agree_pages/presentation/state_managment/birthdate_view_model.dart';
import 'package:lailaty/feature/agree_pages/presentation/state_managment/personal_information_view.dart';
import 'package:lailaty/feature/agree_pages/presentation/view/carInfo.dart';
import 'package:lailaty/feature/agree_pages/presentation/view/editingCar.dart';
import 'package:lailaty/feature/agree_pages/presentation/view/motor_info.dart';
import 'package:lailaty/feature/choose_category_page/presentation/view/categoryView.dart';
import '../../feature/agree_pages/presentation/view/noticeToDriverView.dart';
import 'package:lailaty/feature/agree_pages/presentation/view/login_prompt_page.dart';
import 'package:lailaty/feature/agree_pages/presentation/view/personal_information_page.dart';
import 'package:lailaty/feature/agree_pages/presentation/view/security_information_page.dart';
import 'package:lailaty/feature/travel/presentation/view/travel_page.dart';
import 'package:provider/provider.dart';

import '../../feature/home_page/presentaion/view/home_page/home_page.dart';
import '../../feature/home_page/presentaion/view/orders/search_orders_page.dart';

class Routes {
  GoRouter router = GoRouter(
    routes: [
      // GoRoute(
      //   path: carInfoPath,
      //   builder: (context, state) => const CarInfoView(),
      // ),
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
          child: ChangeNotifierProvider(
            create: (_) => PersonalInformationView(),
            child: const MotorInfoView(),
          ),
          transitionsBuilder: _fadeTransition,
        ),
      ),
      GoRoute(
        path: AppKeys.searchOrderPage,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: HomePageView(),
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
