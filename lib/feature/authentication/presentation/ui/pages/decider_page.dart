import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lailaty/core/config/storage/secure_storage_service.dart';
import 'package:lailaty/core/config/storage/service_locator.dart';
import 'package:lailaty/core/resources/color_manager.dart';
import 'package:lailaty/core/resources/key_manager.dart';
import 'package:lailaty/feature/authentication/data/models/user_model.dart';

class DeciderPage extends StatelessWidget {
  const DeciderPage({Key? key}) : super(key: key);

  Future<String> _determineNextRoute() async {
    final storage = sl<SecureStorageService>();

    // 1) فحص أول تشغيل
    final isFirstEither = await storage.getIsFirstTime();
    final isFirst = isFirstEither.fold((err) {
      print("[DeciderPage] Error checking isFirstTime, defaulting to true");
      return true;
    }, (val) {
      print("[DeciderPage] isFirstTime flag: $val");
      return val;
    });
    if (isFirst) {
      print("[DeciderPage] First time detected. Navigating to SplashVideo.");
      await storage.setIsFirstTime(false);
      return AppKeys.splashVideoPageKey; // عادة "/"
    }

    // 2) فحص بيانات المصادقة المخزنة
    final authEither = await storage.getCachedAuthData();
    final authData = authEither.fold((err) {
      print("[DeciderPage] Error retrieving auth data: $err");
      return null;
    }, (data) {
      print("[DeciderPage] Auth data retrieved: $data");
      return data;
    });
    if (authData == null || authData['isLoggedIn'] != true) {
      print("[DeciderPage] No valid auth data. Navigating to LoginPage.");
      return AppKeys.loginPageKey; // مثل "/login"
    }

    // 3) المستخدم مسجّل دخول → نحدد الصفحة التالية حسب حالته
    print("[DeciderPage] User is logged in. Determining next page...");
    final user = authData['user'] as UserModel;
    print("[DeciderPage] User model: ${user.toJson()}");

    // 3.a) إذا البروفايل ناقص
    if (user.firstName.isEmpty ||
        user.lastName.isEmpty ||
        user.phoneNumber.isEmpty ||
        user.gender.isEmpty ||
        user.city.isEmpty) {
      print(
        "[DeciderPage] Incomplete user profile detected. Navigating to UserInfoPage"
      );
      return AppKeys.userInfoPageKey; // مثل "/userInfo"
    }

    // 3.b) قراءة الـ flags المحلية
    Future<bool> _localBool(String key) async {
      final v = await storage.secureStorage.read(key: key);
      print("[DeciderPage] Value for key '$key': $v");
      return v == 'true';
    }

    final fleetCreated     = await _localBool('fleet_created');
    final documentsValid   = await _localBool('documents_valid');
    final carDocValid      = await _localBool('car_doc_valid');
    final joinRequestValid = await _localBool('join_request_valid');

    print(
      "[DeciderPage] fleetCreated: $fleetCreated, "
      "documentsValid: $documentsValid, carDocValid: $carDocValid, "
      "joinRequestValid: $joinRequestValid"
    );

    // 3.c) التوجيه حسب الدور
    switch (user.role) {
      case 'fleetOwner':
        if (user.officeId != null || fleetCreated) {
          print("[DeciderPage] fleetOwner: Navigating to FleetOptionsPage");
          return AppKeys.fleetOptionsPage; // مثل "/fleetOptions"
        } else {
          print("[DeciderPage] fleetOwner: Navigating to FleetInformationPage");
          return AppKeys.fleetInformationPage; // مثل "/fleetInfo"
        }

      case 'freeDriver':
        if (!user.hasDocuments && !documentsValid) {
          print(
            "[DeciderPage] freeDriver: Incomplete documents. "
            "Navigating to PersonalInformationPage"
          );
          return AppKeys.personalInformationPageKey; // "/personalInfo"
        } else if (carDocValid) {
          print(
            "[DeciderPage] freeDriver: Car doc is valid. Navigating to HomePageView"
          );
          return AppKeys.searchOrderPage; // "/searchOrder"
        } else {
          print(
            "[DeciderPage] freeDriver: Car doc is invalid. Navigating to LoginPromptPage"
          );
          return AppKeys.loginPromptPageKey; // "/loginPrompt"
        }

      case 'employeeDriver':
        if (!joinRequestValid) {
          print(
            "[DeciderPage] employeeDriver: No join request. Navigating to FleetToJoinPage"
          );
          return AppKeys.fleetToJoinPage; // "/fleetToJoin"
        } else if (!user.hasDocuments || !documentsValid) {
          print(
            "[DeciderPage] employeeDriver: Incomplete documents. Navigating to PersonalInformationPage"
          );
          return AppKeys.personalInformationPageKey;
        } else {
          print(
            "[DeciderPage] employeeDriver: Documents ok. Navigating to HomePageView"
          );
          return AppKeys.searchOrderPage;
        }

      default:
        print("[DeciderPage] Unknown role. Falling back to HomePageView");
        return AppKeys.searchOrderPage;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: _determineNextRoute(),
      builder: (context, snap) {
        if (snap.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            backgroundColor: ColorManager.grey1,
            body: Center(
              child: CircularProgressIndicator(
                color: ColorManager.backGroundColor,
              ),
            ),
          );
        }
        if (snap.hasError) {
          return Scaffold(
            body: Center(child: Text('Error: ${snap.error}')),
          );
        }
        final nextPath = snap.data!;
        // نفّذ التنقل عبر GoRouter
        WidgetsBinding.instance.addPostFrameCallback((_) {
          GoRouter.of(context).go(nextPath);
        });
        // placeholder فارغ أثناء الانتقال
        return const Scaffold(body: SizedBox.shrink());
      },
    );
  }
}
