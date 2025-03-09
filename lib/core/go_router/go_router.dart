import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:lailaty/core/config/presentation/pages/dynamic_page_view.dart';
import 'package:lailaty/core/resources/key_manager.dart';
import 'package:lailaty/feature/agree_pages/carInfo/presentation/view/carInfo.dart';
import 'package:lailaty/feature/agree_pages/carInfo/presentation/view/editingCar.dart';
import 'package:lailaty/feature/agree_pages/carInfo/presentation/view/motor_info.dart';
import 'package:lailaty/feature/agree_pages/presentation/view/personal_information_page.dart';
import 'package:lailaty/feature/choose_category_page/presentation/view/categoryView.dart';
import 'package:lailaty/feature/fleet/presentation/view/fleet_options_page.dart';
import 'package:lailaty/feature/fleet/presentation/view/fleet_performance.dart';
import 'package:lailaty/feature/fleet/presentation/view/fleet_to_join.dart';
import 'package:lailaty/feature/fleet/presentation/view/fleet_home_page.dart';

import 'package:lailaty/feature/fleet/presentation/view/fleet_infromation_page.dart';
import 'package:lailaty/feature/on_your_mood/presentation/view/complete_on_your_mood_order.dart';
import 'package:lailaty/feature/side_bar_screens/presentation/view/inbox_page.dart';
import 'package:lailaty/feature/side_bar_screens/presentation/view/order_history_page.dart';
import 'package:lailaty/feature/splash/page/user_info_page.dart';
import 'package:lailaty/feature/teach_driving/presentation/view/complete_teach_driving_order.dart';
import 'package:lailaty/feature/travel/presentation/view/complete_travel_order.dart';
import 'package:lailaty/feature/wedding_business/presentation/view/complete_widding_and_business_order.dart';

import '../../feature/agree_pages/presentation/view/noticeToDriverView.dart';
import 'package:lailaty/feature/agree_pages/presentation/view/login_prompt_page.dart';

import 'package:lailaty/feature/agree_pages/presentation/view/security_information_page.dart';

import 'package:lailaty/core/resources/string_manager.dart';
import 'package:lailaty/core/viewmodels/birthdate_view_model.dart';
import 'package:lailaty/core/viewmodels/personal_information_view.dart';

import 'package:lailaty/feature/inland_transportation/presentation/view/inland_transportation.dart';
import 'package:lailaty/feature/side_bar_screens/presentation/state_managment/car_list_view_model.dart';
import 'package:lailaty/feature/side_bar_screens/presentation/view/call_us_page.dart';
import 'package:lailaty/feature/side_bar_screens/presentation/view/profile_page.dart';
import 'package:lailaty/feature/side_bar_screens/presentation/view/safety_page.dart';
import 'package:lailaty/feature/side_bar_screens/presentation/view/settings_page.dart';
import 'package:lailaty/feature/side_bar_screens/presentation/view/share_app_page.dart';
import 'package:provider/provider.dart';
import '../../feature/fleet/presentation/view/captain_fleet_profile.dart';

import '../../feature/home_page/presentaion/view/home_page/home_page.dart';

class Routes {
  GoRouter router = GoRouter(
    routes: [
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
                create: (_) => DateviewModel(),
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
        path: AppKeys.inboxPagePath,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const InboxPage(),
          transitionsBuilder: _fadeTransition,
        ),
      ),
      GoRoute(
        path: AppKeys.orderHistoryPagePath,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const OrderHistoryPage(),
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
        path: AppKeys.completeTravelOrderPage,
        pageBuilder: (context, state) {
          final extra = state.extra as Map<String, dynamic>?;
          String initialContainerKey = extra?[AppKeys.initialContainerKey] ??
              AppKeys.journeyCompletedContainer;
          return CustomTransitionPage(
            key: state.pageKey,
            child: CompleteTravelOrder(
              initialContainerKey: initialContainerKey,
            ),
            transitionsBuilder: _fadeTransition,
          );
        },
      ),

      GoRoute(
        path: AppKeys.completeWiddingAndBusinessOrderPage,
        pageBuilder: (context, state) {
          final extra = state.extra as Map<String, dynamic>?;
          String initialContainerKey = extra?[AppKeys.initialContainerKey] ??
              AppKeys.journeyCompletedContainer;
          return CustomTransitionPage(
            key: state.pageKey,
            child: CompleteWiddingAndBusinessOrder(
              initialContainerKey: initialContainerKey,
            ),
            transitionsBuilder: _fadeTransition,
          );
        },
      ),

      GoRoute(
        path: AppKeys.completeTeachDrivingOrderPage,
        pageBuilder: (context, state) {
          final extra = state.extra as Map<String, dynamic>?;
          String initialContainerKey = extra?[AppKeys.initialContainerKey] ??
              AppKeys.journeyCompletedContainer;
          return CustomTransitionPage(
            key: state.pageKey,
            child: CompleteTeachDrivingOrder(
              initialContainerKey: initialContainerKey,
            ),
            transitionsBuilder: _fadeTransition,
          );
        },
      ),

      GoRoute(
        path: AppKeys.completeOnYourMoodOrderPage,
        pageBuilder: (context, state) {
          final extra = state.extra as Map<String, dynamic>?;
          String initialContainerKey = extra?[AppKeys.initialContainerKey] ??
              AppKeys.journeyCompletedContainer;
          return CustomTransitionPage(
            key: state.pageKey,
            child: CompleteOnYourMoodOrder(
              initialContainerKey: initialContainerKey,
            ),
            transitionsBuilder: _fadeTransition,
          );
        },
      ),

      GoRoute(
        path: AppKeys.completeOrderInlandTransportationPage,
        pageBuilder: (context, state) {
          final extra = state.extra as Map<String, dynamic>?;
          String initialContainerKey = extra?[AppKeys.initialContainerKey] ??
              AppKeys.journeyCompletedContainer;
          return CustomTransitionPage(
            key: state.pageKey,
            child: InlandTransportationCompleteOrder(
              initialContainerKey: initialContainerKey,
            ),
            transitionsBuilder: _fadeTransition,
          );
        },
      ),

//fleet :
      GoRoute(
        path: AppKeys.fleetToJoinPage,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const FleetToJoinPage(),
          transitionsBuilder: _fadeTransition,
        ),
      ),
//for fleet owner :
      GoRoute(
        path: AppKeys.fleetInformationPage,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: ChangeNotifierProvider(
                create: (_) => PersonalInformationView(),
                child: const FleetInfromationPage()),
            transitionsBuilder: _fadeTransition,
          );
        },
      ),
      GoRoute(
        path: AppKeys.fleetOptionsPage,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: const FleetOptionsPage(),
            transitionsBuilder: _fadeTransition,
          );
        },
      ),
      //option 1
      GoRoute(
        path: AppKeys.fleetPerformancePage,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: FleetPerformancePage(),
          transitionsBuilder: _fadeTransition,
        ),
      ),
//option 2
      GoRoute(
        path: AppKeys.fleetHomePageViewPath,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: fleetHomePageView(),
          transitionsBuilder: _fadeTransition,
        ),
      ),
//option 2 >new orders
      GoRoute(
        path: AppKeys.profileOfcaptainFleet,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const CaptainFleetProfile(),
          transitionsBuilder: _fadeTransition,
        ),
      ),

//
      GoRoute(
        path: '/', // AppKeys.profileOfcaptainFleet,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const UserInfoPage(),
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
