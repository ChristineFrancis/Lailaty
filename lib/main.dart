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

//adding the datePicker to travel page
//making safety page ui
//making share app page ui
//change the appbar border in customwidget
//fix the date select in travel



//! fixing the call us page : >> text <<