//(log out) — the user is automatically taken to the login page (/log in) without manually refreshing.
//(log in) — the user returns to the page they were on before logging in.

// import 'package:flutter/foundation.dart';

// class AuthStateNotifier extends ChangeNotifier {
//   bool _loggedIn = false;

//   bool get loggedIn => _loggedIn;

//   /// إستدعها بعد نجاح تسجيل الدخول
//   void login() {
//     _loggedIn = true;
//     notifyListeners();
//   }

//   /// إستدعها عند تسجيل الخروج
//   void logout() {
//     _loggedIn = false;
//     notifyListeners();
//   }
// }