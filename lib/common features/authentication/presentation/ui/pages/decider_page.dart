import 'package:flutter/material.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/pages/on_boarding.dart';
import 'package:lailaty/core/services/secure_storage_service.dart';

import '../../../../../core/config/storage/dependency_injection.dart';
import 'home_page.dart';
import 'login_page.dart';

class DeciderPage extends StatelessWidget {
  const DeciderPage({super.key});

  Future<Widget> _determineStartPage() async {
    final secureStorageService = sl<SecureStorageService>();

    // Check if it's the first time launching the app.
    final isFirstTimeEither = await secureStorageService.getIsFirstTime();
    bool isFirstTime = isFirstTimeEither.fold((_) => true, (val) => val);
    if (isFirstTime) {
      // Mark as not first time.
      await secureStorageService.setIsFirstTime(false);
      return const OnBoarding();
    } else {
      final authDataEither = await secureStorageService.getCachedAuthData();
      final authData = authDataEither.fold((_) => null, (data) => data);
      if (authData != null && authData['isLoggedIn'] == true) {
        return const HomePage();
      }
      return const LoginPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Widget>(
      future: _determineStartPage(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(body: Center(child: CircularProgressIndicator()));
        }
        if (snapshot.hasError) {
          return Scaffold(body: Center(child: Text('Error: ${snapshot.error}')));
        }
        return snapshot.data!;
      },
    );
  }
}
