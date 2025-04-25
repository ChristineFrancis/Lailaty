import 'package:flutter/material.dart';
import 'package:lailaty/core/config/storage/service_locator.dart';
import 'package:lailaty/core/config/storage/secure_storage_service.dart';
import 'package:lailaty/core/resources/color_manager.dart';
import 'package:lailaty/core/state_managments/birthdate_view_model.dart';
import 'package:lailaty/feature/agree_pages/carInfo/presentation/view/captain_register_pages/personal_information_page.dart';
import 'package:lailaty/feature/agree_pages/presentation/view/login_prompt_page.dart';
import 'package:lailaty/feature/authentication/data/models/user_model.dart';
import 'package:lailaty/feature/authentication/presentation/ui/pages/on_boarding.dart';
import 'package:lailaty/feature/fleet/presentation/view/fleet_infromation_page.dart';
import 'package:lailaty/feature/fleet/presentation/view/fleet_options_page.dart';
import 'package:lailaty/feature/fleet/presentation/view/fleet_to_join.dart';
import 'package:lailaty/feature/home_page/presentaion/view/home_page/home_page.dart';
import 'package:provider/provider.dart';
import 'login_page.dart';

// class DeciderPage extends StatelessWidget {
//   const DeciderPage({super.key});

//   Future<Widget> _determineStartPage() async {
//     final secureStorageService = sl<SecureStorageService>();

//     //! if first time in app
//     final isFirstTimeEither = await secureStorageService.getIsFirstTime();
//     bool isFirstTime = isFirstTimeEither.fold((_) => true, (val) => val);
//     if (isFirstTime) {
//       //! Mark as not first time.
//       await secureStorageService.setIsFirstTime(false);
//       return const OnBoarding();
//     } else {
//       final authDataEither = await secureStorageService.getCachedAuthData();
//       final authData = authDataEither.fold((_) => null, (data) => data);
//       if (authData != null && authData['isLoggedIn'] == true) {
//         return HomePageView(); //HomePage();
//       }
//       return const LoginPage();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<Widget>(
//       future: _determineStartPage(),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const Scaffold(
//             backgroundColor: ColorManager.backGroundColor,
//             body: Center(
//               child: CircularProgressIndicator(
//                 color: ColorManager.grey1,
//               ),
//             ),
//           );
//         }
//         if (snapshot.hasError) {
//           return Scaffold(
//               body: Center(child: Text('Error: ${snapshot.error}')));
//         }
//         return snapshot.data!;
//       },
//     );
//   }
// }

class DeciderPage extends StatelessWidget {
  const DeciderPage({Key? key}) : super(key: key);

  Future<Widget> _determineStartPage() async {
    final secureStorageService = sl<SecureStorageService>();

    final isFirstTimeEither = await secureStorageService.getIsFirstTime();
    final isFirstTime = isFirstTimeEither.fold((_) {
      print("[DeciderPage] Error checking isFirstTime, defaulting to true");
      return true;
    }, (val) {
      print("[DeciderPage] isFirstTime flag: $val");
      return val;
    });

    if (isFirstTime) {
      print("[DeciderPage] First time detected. Navigating to OnBoarding.");
      await secureStorageService.setIsFirstTime(false);
      return const OnBoarding();
    } else {
      // Get cached auth data.
      final authDataEither = await secureStorageService.getCachedAuthData();
      final authData = authDataEither.fold((error) {
        print("[DeciderPage] Error retrieving auth data: $error");
        return null;
      }, (data) {
        print("[DeciderPage] Auth data retrieved: $data");
        return data;
      });

      if (authData != null && authData['isLoggedIn'] == true) {
        print("[DeciderPage] User is logged in. Determining next page...");
        final nextPage = await determineNextPage();
        print("[DeciderPage] Next page determined: ${nextPage.runtimeType}");
        return nextPage;
      }
      print("[DeciderPage] No valid auth data. Navigating to LoginPage.");
      return const LoginPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Widget>(
      future: _determineStartPage(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            backgroundColor: ColorManager.grey1,
            body: Center(
              child: CircularProgressIndicator(
                color: ColorManager.backGroundColor,
              ),
            ),
          );
        }
        if (snapshot.hasError) {
          return Scaffold(
              body: Center(child: Text('Error: ${snapshot.error}')));
        }
        return snapshot.data!;
      },
    );
  }
}

// Helper method: determineNextPage()
Future<Widget> determineNextPage() async {
  final secureStorageService = sl<SecureStorageService>();

  final authDataEither = await secureStorageService.getCachedAuthData();
  final authData = authDataEither.fold((error) {
    print("[determineNextPage] Error retrieving auth data: $error");
    return null;
  }, (data) {
    print("[determineNextPage] Auth data retrieved: $data");
    return data;
  });

  if (authData == null || authData['isLoggedIn'] != true) {
    print("[determineNextPage] Auth data invalid. Returning LoginPage.");
    return const LoginPage();
  }

  final user = authData['user'] as UserModel;
  print("[determineNextPage] User model: ${user.toJson()}");

  // Helper function to read local booleans.
  Future<bool> getLocalBool(String key) async {
    final val = await secureStorageService.secureStorage.read(key: key);
    print("[determineNextPage] Value for key '$key': $val");
    return val == 'true';
  }

  // Local validations
  final fleetCreated = await getLocalBool('fleet_created');
  final documentsValid = await getLocalBool('documents_valid');
  final carDocValid = await getLocalBool('car_doc_valid');
  final joinRequestValid = await getLocalBool('join_request_valid');

  print(
      "[determineNextPage] fleetCreated: $fleetCreated, documentsValid: $documentsValid, carDocValid: $carDocValid, joinRequestValid: $joinRequestValid");
  final userRole =
      await secureStorageService.secureStorage.read(key: 'user_role');

  print('user role :$userRole');
  print('use role form back: ${user.role}');
  switch (user.role) {
    case 'fleetOwner':
      if (user.officeId != null || fleetCreated == true) {
        print(
            "[determineNextPage] fleetOwner: Navigating to FleetHomePageView");
        return const FleetOptionsPage();
      } else {
        print(
            "[determineNextPage] fleetOwner: Navigating to FleetInformationPage");
        return const FleetInformationPage();
      }

    case 'freeDriver':
      if (user.hasDocuments == false && documentsValid == false) {
        print(
            "[determineNextPage] freeDriver: Incomplete documents. Navigating to PersonalInformationPage");
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => DateviewModel()),
          ],
          child: const PersonalInformationPage(),
        );
      } else {
        if (carDocValid == true) {
          print(
              "[determineNextPage] freeDriver: Car doc is valid. Navigating to HomePageView");
          return HomePageView();
        } else {
          print(
              "[determineNextPage] freeDriver: Car doc is invalid. Navigating to LoginPromptPage");
          return const LoginPromptPage();
        }
      }

    case 'employeeDriver':
      if (!joinRequestValid) {
        print(
            "[determineNextPage] employeeDriver: No join request submitted. Navigating to FleetToJoinPage");
        return const FleetToJoinPage();
      } else {
        if (user.hasDocuments == false || documentsValid == false) {
          print(
              "[determineNextPage] employeeDriver: Incomplete documents. Navigating to PersonalInformationPage");
          return MultiProvider(
            providers: [
              ChangeNotifierProvider(create: (_) => DateviewModel()),
            ],
            child: const PersonalInformationPage(),
          );
        } else {
          if (carDocValid == true) {
            print(
                "[determineNextPage] employeeDriver: Car doc is valid. Navigating to HomePageView");
            return HomePageView();
          } else {
            print(
                "[determineNextPage] employeeDriver: Car doc is invalid. Navigating to LoginPromptPage");
            return const LoginPromptPage();
          }
        }
      }

    default:
      print("[determineNextPage] Unknown role. Falling back to HomePageView");
      return HomePageView();
  }
}
