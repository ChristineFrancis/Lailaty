import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:lailaty/core/config/presentation/pages/dynamic_page_view.dart';
import 'package:lailaty/core/resources/key_manager.dart';
import 'package:lailaty/core/resources/string_manager.dart';
import 'package:lailaty/core/viewmodels/birthdate_view_model.dart';
import 'package:lailaty/core/viewmodels/personal_information_view.dart';
import 'package:lailaty/feature/agreeScreens/presentation/view/carInfo.dart';
import 'package:lailaty/feature/agreeScreens/presentation/view/editingCar.dart';
import 'package:lailaty/feature/agreeScreens/presentation/view/motor_info.dart';
import 'package:lailaty/feature/chooseCategoryScreens/presentation/view/categoryView.dart';
import 'package:lailaty/feature/map/presentation/view/map_screen.dart';
import 'package:lailaty/feature/side_bar_screens/presentation/state_managment/car_list_view_model.dart';
import 'package:lailaty/feature/side_bar_screens/presentation/view/call_us_page.dart';
import 'package:lailaty/feature/side_bar_screens/presentation/view/profile_page.dart';
import 'package:lailaty/feature/side_bar_screens/presentation/view/safety_page.dart';
import 'package:lailaty/feature/side_bar_screens/presentation/view/settings_page.dart';
import 'package:lailaty/feature/side_bar_screens/presentation/view/share_app_page.dart';
import 'package:lailaty/main.dart';
import '../../feature/agreeScreens/presentation/view/noticeToDriverView.dart';
import 'package:lailaty/feature/agreeScreens/presentation/view/login_prompt_page.dart';
import 'package:lailaty/feature/agreeScreens/presentation/view/personal_information_page.dart';
import 'package:lailaty/feature/agreeScreens/presentation/view/security_information_page.dart';
import 'package:provider/provider.dart';

class Routes {
  GoRouter router = GoRouter(
    routes: [
      //?delete this :
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
          pageBuilder: (context, state) {
            return CustomTransitionPage(
              key: state.pageKey,
              child: ChangeNotifierProvider(
                create: (context) => PersonalInformationView(),
                child: CarInfoView(
                  onNavigate: state.extra as VoidCallback?,
                ),
              ),
              transitionsBuilder: _fadeTransition,
            );
          }),
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
        path: AppKeys.noticeToDriverPath,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const NoticeToDriverView(),
          transitionsBuilder: _fadeTransition,
        ),
      ),
      // GoRoute(
      //   path: AppKeys.showCategoryPath,
      //   pageBuilder: (context, state) => CustomTransitionPage(
      //     key: state.pageKey,
      //     child: const CategoryView(),
      //     transitionsBuilder: _fadeTransition,
      //   ),
      // ),

      // GoRoute(
      //   path: AppKeys.personalInformationPageKey,
      //   pageBuilder: (context, state) => CustomTransitionPage(
      //     key: state.pageKey,
      //     child: MultiProvider(
      //       providers: [
      //         ChangeNotifierProvider(
      //           create: (_) => PersonalInformationView(),
      //         ),
      //         ChangeNotifierProvider(
      //           create: (_) => DateviewModel(),
      //         ),
      //       ],
      //       child: const PersonalInformationPage(),
      //     ),
      //     transitionsBuilder: _fadeTransition,
      //   ),
      // ),
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
          path: AppKeys.dynamicPageViewKey,
          pageBuilder: (context, state) {
            final extra = state.extra as Map<String, dynamic>?;

            return CustomTransitionPage(
              key: state.pageKey,
              child: ChangeNotifierProvider(
                create: (context) => DateviewModel(),
                child: DynamicPageView(
                  appBarTitle: extra?[AppKeys.appBarTitleKey] ??
                      StringManager.travelTitle,
                  pages: extra?[AppKeys.pagesKey] ?? [],
                  initialIndex: extra?[AppKeys.initialIndexKey] ?? 1,
                ),
              ),
              transitionsBuilder: _fadeTransition,
            );
          }),
      GoRoute(
        path: AppKeys.safetyPageKey,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const SafetyPage(),
          transitionsBuilder: _fadeTransition,
        ),
      ),
      GoRoute(
        path: AppKeys.shareAppPageKey,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const ShareAppPage(),
          transitionsBuilder: _fadeTransition,
        ),
      ),
      GoRoute(
        path: AppKeys.callUsPageKey,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const CallUsPage(),
          transitionsBuilder: _fadeTransition,
        ),
      ),
      GoRoute(
        path: AppKeys.settingsPageKey,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const SettingsPage(),
          transitionsBuilder: _fadeTransition,
        ),
      ),
      GoRoute(
        path: AppKeys.profilePageKey,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: MultiProvider(
            providers: [
              ChangeNotifierProvider(
                create: (_) => PersonalInformationView(),
              ),
              ChangeNotifierProvider(
                create: (_) => CarListViewModel(),
              ),
            ],
            child: const ProfilePage(),
          ),
          transitionsBuilder: _fadeTransition,
        ),
      ),
      GoRoute(
        path: AppKeys.mapPageKey,
        pageBuilder: (context, state) {
          String initialContainerKey = //AppKeys.cancelJourneyContainer;
              state.extra as String; // ?? AppKeys.journeyCompleted;

          return CustomTransitionPage(
            key: state.pageKey,
            child: MapPage(initialContainerKey: initialContainerKey),
            transitionsBuilder: _fadeTransition,
          );
        },
      ),

      //! this page to nav to the travel and widding ..
      //! temp page !!
      GoRoute(
        path: '/',
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const TestPage(),
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
