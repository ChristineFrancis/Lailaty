import 'package:flutter/material.dart';
import 'package:lailaty/core/services/secure_storage_service.dart';
import 'package:lailaty/core/config/storage/dependency_injection.dart';
import 'package:lailaty/core/resources/color_manager.dart';
import '../../../data/models/user_model.dart';
import 'home_page.dart';

class UserDetailsPage extends StatelessWidget {
  const UserDetailsPage({super.key});

  Future<UserModel?> _getUserFromStorage() async {
    final secureStorageService = sl<SecureStorageService>();
    final result = await secureStorageService.getCachedAuthData();
    return result.fold((l) => null, (data) => data?['user'] as UserModel?);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Your Information")),
      body: FutureBuilder<UserModel?>(
        future: _getUserFromStorage(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data == null) {
            return const Center(child: Text("No user data found."));
          }
          final user = snapshot.data!;
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("ID: ${user.id}", style: const TextStyle(fontSize: 16)),
                const SizedBox(height: 8),
                Text("Email: ${user.email}", style: const TextStyle(fontSize: 16)),
                const SizedBox(height: 8),
                Text("First Name: ${user.firstName}", style: const TextStyle(fontSize: 16)),
                const SizedBox(height: 8),
                Text("Last Name: ${user.lastName}", style: const TextStyle(fontSize: 16)),
                const SizedBox(height: 8),
                Text("Phone Number: ${user.phoneNumber}", style: const TextStyle(fontSize: 16)),
                const SizedBox(height: 8),
                Text("Gender: ${user.gender}", style: const TextStyle(fontSize: 16)),
                const SizedBox(height: 8),
                Text("Birth Date: ${user.birthDate.toLocal().toIso8601String().split('T').first}", style: const TextStyle(fontSize: 16)),
                const SizedBox(height: 8),
                Text("City: ${user.city}", style: const TextStyle(fontSize: 16)),
                const SizedBox(height: 8),
                Text("Role: ${user.role}", style: const TextStyle(fontSize: 16)),
                const Spacer(),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorManager.yellow,
                    ),
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (_) => const HomePage()),
                      );
                    },
                    child: const Text("Go to Home", style: TextStyle(fontSize: 18)),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
