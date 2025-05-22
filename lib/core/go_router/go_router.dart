import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:lailaty/core/auth/auth_service.dart';
import 'package:lailaty/core/config/storage/service_locator.dart';
import 'package:lailaty/core/presentation/pages/dynamic_page_view.dart';
import 'package:lailaty/core/presentation/widget/splash_video/splash_video.dart';
import 'package:lailaty/core/network/network_connection.dart';
import 'package:lailaty/core/resources/key_manager.dart';
import 'package:lailaty/feature/agree_pages/carInfo/data/data_source/remote_data_source.dart';
import 'package:lailaty/feature/agree_pages/carInfo/data/repo/agree_pages_repo_impl.dart';
import 'package:lailaty/feature/agree_pages/carInfo/domain/use_case/add_car_usecase.dart';
import 'package:lailaty/feature/agree_pages/carInfo/presentation/state_managment/add_car_bloc/add_veicle_bloc.dart';
import 'package:lailaty/feature/agree_pages/carInfo/presentation/view/carInfo.dart';
import 'package:lailaty/feature/agree_pages/carInfo/presentation/view/editing_car.dart';
import 'package:lailaty/feature/agree_pages/carInfo/presentation/view/motor_info.dart';
import 'package:lailaty/feature/agree_pages/carInfo/presentation/view/captain_register_pages/personal_information_page.dart';
import 'package:lailaty/feature/authentication/presentation/ui/pages/choose_city_page.dart';
import 'package:lailaty/feature/authentication/presentation/ui/pages/decider_page.dart';
import 'package:lailaty/feature/authentication/presentation/ui/pages/information_register_page.dart';
import 'package:lailaty/feature/authentication/presentation/ui/pages/location_page.dart';
import 'package:lailaty/feature/authentication/presentation/ui/pages/login_page.dart';
import 'package:lailaty/feature/authentication/presentation/ui/pages/notification_page.dart';
import 'package:lailaty/feature/authentication/presentation/ui/pages/privacy_policy_page.dart';
import 'package:lailaty/feature/authentication/presentation/ui/pages/register_with_email_page.dart';
import 'package:lailaty/feature/authentication/presentation/ui/pages/user_details_page.dart';
import 'package:lailaty/feature/authentication/presentation/ui/pages/verification_code_page.dart';
import 'package:lailaty/feature/choose_category_page/presentation/view/categoryView.dart';
import 'package:lailaty/feature/fleet/presentation/view/fleet_options_page.dart';
import 'package:lailaty/feature/fleet/presentation/view/fleet_performance.dart';
import 'package:lailaty/feature/fleet/presentation/view/fleet_to_join.dart';
import 'package:lailaty/feature/fleet/presentation/view/fleet_home_page.dart';
import 'package:lailaty/feature/fleet/presentation/view/fleet_infromation_page.dart';
import 'package:lailaty/feature/on_your_mood/presentation/view/complete_on_your_mood_order.dart';
import 'package:lailaty/feature/side_bar_screens/presentation/view/inbox_page.dart';
import 'package:lailaty/feature/side_bar_screens/presentation/view/order_history_page.dart';
import 'package:lailaty/feature/authentication/presentation/ui/pages/user_info_page.dart';
import 'package:lailaty/feature/side_bar_screens/presentation/view/rules_page.dart';
import 'package:lailaty/feature/teach_driving/presentation/view/complete_teach_driving_order.dart';
import 'package:lailaty/feature/travel/presentation/view/complete_travel_order.dart';
import 'package:lailaty/feature/wedding_business/presentation/view/complete_widding_and_business_order.dart';
import '../../feature/agree_pages/carInfo/presentation/view/noticeToDriverView.dart';
import 'package:lailaty/feature/agree_pages/carInfo/presentation/view/login_prompt_page.dart';
import 'package:lailaty/feature/agree_pages/carInfo/presentation/view/captain_register_pages/security_information_page.dart';
import 'package:lailaty/core/resources/string_manager.dart';
import 'package:lailaty/core/state_managments/birthdate_view_model.dart';
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
    navigatorKey: navigatorKey,
    routes: [
      GoRoute(
          path: AppKeys.carInfoPath,
          pageBuilder: (context, state) {
            return CustomTransitionPage(
              key: state.pageKey,
              // child: BlocProvider(
              //   create: (context) => AddVeicleBloc(
              //       addCarUsecase: AddCarUsecase(
              //     repo: AgreePagesRepoImpl(
              //         agreePagesRemoteDateSource:
              //             AgreePagesRemoteDateSourceImpl(
              //                 client: sl(), apiClient: sl()), //! must fix this
              //         networkInfo: NetworkInfoImplement(
              //             isConnect: InternetConnectionChecker.instance)),
              //   )),
              child: CarInfoView(
                onNavigate: state.extra as VoidCallback?,
                //  ),
              ),
              //  ),
              transitionsBuilder: _fadeTransition,
            );
          }),
      GoRoute(
          path: AppKeys.editingCarPage,
          pageBuilder: (context, state) {
            final args = state.extra as Map<String, dynamic>;
            return CustomTransitionPage(
              key: state.pageKey,
              child: EditingCar(
                initialNewCar: args['new'],
                initialOriginalCar: args['original'],
                carOptions: List<String>.from(args['carOptions']),
              ),
              transitionsBuilder: _fadeTransition,
            );
          }),
      GoRoute(
        path: AppKeys.motorInfoPath,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          // child: ChangeNotifierProvider(
          //   create: (_) => PersonalInformationView(),
          child: const MotorInfoView(),
          // ),
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
              // ChangeNotifierProvider(
              //   create: (_) => PersonalInformationView(),
              // ),
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
        pageBuilder: (context, state) {
          final extra = state.extra as String;

          return CustomTransitionPage(
            key: state.pageKey,
            // child: BlocProvider(
            //   create: (context) => CaptainRegisterBloc(
            //     captainRegisterUseCase: CaptainRegistrationUsecase(
            //       repo: AgreePagesRepoImpl(
            //         agreePagesRemoteDateSource:
            //             AgreePagesRemoteDateSourceImpl(client: http.Client()),
            //         networkInfo: NetworkInfoImplement(
            //             isConnect: InternetConnectionChecker.instance),
            //       ),
            //     ),
            //   ),
            child: SecurityInformationPage(
              birthDate: extra,
            ),
            // ),
            transitionsBuilder: _fadeTransition,
          );
        },
      ),
      GoRoute(
        path: AppKeys.splashVideoPageKey, // AppKeys.loginPromptPageKey,
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
              // ChangeNotifierProvider(
              //   create: (_) => PersonalInformationView(),
              // ),
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
            // child: ChangeNotifierProvider(
            //     create: (_) => PersonalInformationView(),
            child: const FleetInformationPage()
            //)
            ,
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
      // GoRoute(
      //   path: AppKeys.profileOfcaptainFleet,
      //   pageBuilder: (context, state) => CustomTransitionPage(
      //     key: state.pageKey,
      //     child: const UserInfoPage(),
      //     transitionsBuilder: _fadeTransition,
      //   ),
      // ),
//!
      //  GoRoute(
      //     path: '/' ,//AppKeys.profileOfcaptainFleet,
      //     pageBuilder: (context, state) => CustomTransitionPage(
      //       key: state.pageKey,
      //       child: const OnBoarding(),
      //       transitionsBuilder: _fadeTransition,
      //     ),
      //   ),
//auth :
      GoRoute(
        path: AppKeys.loginPromptPageKey, //
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const SplashVideo(),
          transitionsBuilder: _fadeTransition,
        ),
      ),

      GoRoute(
        name: 'decider',
        path: AppKeys.deciderPageKey,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const DeciderPage(),
          transitionsBuilder: _fadeTransition,
        ),
      ),

      GoRoute(
        path: AppKeys.privacyPolicyPageKey,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const PrivacyPolicyPage(),
          transitionsBuilder: _fadeTransition,
        ),
      ),
      GoRoute(
        path: AppKeys.loginPageKey,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const LoginPage(),
          transitionsBuilder: _fadeTransition,
        ),
      ),
      GoRoute(
        path: AppKeys.registerWithEmailPageKey,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const RegisterWithEmailPage(),
          transitionsBuilder: _fadeTransition,
        ),
      ),
      // GoRoute(
      //   path: AppKeys.homePagekey,
      //   pageBuilder: (context, state) => CustomTransitionPage(
      //     key: state.pageKey,
      //     child: const HomePage(),
      //     transitionsBuilder: _fadeTransition,
      //   ),
      // ),
      GoRoute(
        path: AppKeys.rulesPageKey,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const RulesPage(),
          transitionsBuilder: _fadeTransition,
        ),
      ),

      GoRoute(
        path: AppKeys.userInfoPageKey,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const UserInfoPage(),
          transitionsBuilder: _fadeTransition,
        ),
      ),

      GoRoute(
        path: AppKeys.informationRegisterPageKey,
        pageBuilder: (context, state) {
          //  final extra = state.extra as String;
          return CustomTransitionPage(
            key: state.pageKey,
            child: InformationRegisterPage(
                //  email: extra,
                ),
            transitionsBuilder: _fadeTransition,
          );
        },
      ),
      GoRoute(
        path: AppKeys.verificationCodePageKey,
        pageBuilder: (context, state) {
          final extra = state.extra as String;
          return CustomTransitionPage(
            key: state.pageKey,
            child: VerificationCodePage(
              email: extra,
            ),
            transitionsBuilder: _fadeTransition,
          );
        },
      ),

      GoRoute(
        path: AppKeys.chooseCityPageKey,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const ChooseCityPage(),
          transitionsBuilder: _fadeTransition,
        ),
      ),
      GoRoute(
        path: AppKeys.locationPageKey,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const LocationPage(),
          transitionsBuilder: _fadeTransition,
        ),
      ),

      GoRoute(
        path: AppKeys.userDetailsPageKey,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const UserDetailsPage(),
          transitionsBuilder: _fadeTransition,
        ),
      ),

      GoRoute(
        path: AppKeys.notificationPageKey,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const NotificationPage(),
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
