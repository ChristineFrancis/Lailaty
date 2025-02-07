import 'package:flutter/material.dart';
import 'package:lailaty/core/go_router/go_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: Routes().router,
      debugShowCheckedModeBanner: false,
    );
  }
}

//! fixing the call us page : >> text <<
//! editing car in the profile <<


//fixed the drawer width, remove the arrow from drawer ,making the NoOrdersWidget singlton, fix the rating container,teach drive container ,and wait container