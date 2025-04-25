// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:go_router/go_router.dart';
// import 'package:lailaty/core/config/storage/service_locator.dart';
// import 'package:lailaty/core/resources/key_manager.dart';
// import 'package:lailaty/core/config/storage/secure_storage_service.dart';
// import 'package:lailaty/feature/authentication/presentation/ui/pages/user_details_page.dart';
// import 'package:lailaty/feature/authentication/presentation/ui/widgets/custom%20widgets/custom%20spaces/spc_y.dart';
// import '../../bloc/logout_bloc/logout_bloc.dart';
// import '../../bloc/logout_bloc/logout_event.dart';
// import '../../bloc/logout_bloc/logout_state.dart';
// import 'login_page.dart';

// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   Future<String?> _getAccessToken() async {
//     final secureStorageService = sl<SecureStorageService>();
//     final result = await secureStorageService.getCachedAuthData();
//     return result.fold(
//         (failure) => null, (data) => data?['access_token'] as String?);
//   }

//   Future<void> _showErrorDialog(BuildContext context, String message) async {
//     return showDialog<void>(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: const Text('Error'),
//           content: Text(message),
//           actions: <Widget>[
//             TextButton(
//               child: const Text('OK'),
//               onPressed: () {
//                 //  Navigator.of(context).pop(); // Dismiss the dialog
//                 context.pop();
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     //! Do NOT wrap with a local BlocProvider since it's provided globally.
//     return BlocListener<LogoutBloc, LogoutState>(
//       listener: (context, state) {
//         if (state is LogoutError) {
//           _showErrorDialog(context, state.message);
//         } else if (state is LogoutLoaded) {
//           // Navigator.of(context).pushAndRemoveUntil(
//           //   MaterialPageRoute(builder: (_) => const LoginPage()),
//           //   (route) => false,
//           // );
//           context.go(AppKeys.loginPageKey);
//         }
//       },
//       child: Scaffold(
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               const Text('Home Page ^_^'),
//               ElevatedButton(
//                 onPressed: () {
//                   // Navigator.of(context).push(
//                   //   MaterialPageRoute(
//                   //     builder: (_) => const UserDetailsPage(),
//                   //   ),
//                   // );
//                   context.push(AppKeys.userDetailsPageKey);
//                 },
//                 child: const Text('show user details'),
//               ),
//               SpcY(y: 40),
//               Text('logout'),
//               IconButton(
//                 icon: const Icon(Icons.logout),
//                 onPressed: () async {
//                   final token = await _getAccessToken();
//                   if (token != null) {
//                     context
//                         .read<LogoutBloc>()
//                         .add(LogoutSubmitted(token: token));
//                   } else {
//                     await _showErrorDialog(context, 'Failed to retrieve token');
//                   }
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
