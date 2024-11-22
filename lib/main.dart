import 'package:flutter/material.dart';
import 'package:lailaty/common%20features/splash/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     // locale: const Locale('ar'), 
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Segeo",
      ),
      home:  SplashPage(),
      // localizationsDelegates: [
      //  GlobalMaterialLocalizations.delegate,
      //  GlobalWidgetsLocalizations.delegate,
      //  GlobalCupertinoLocalizations.delegate,
      // ],
      // supportedLocales: const [
      //   Locale('ar'), // Arabic locale
      // ],

      // builder: (context, child) {
      //   return Directionality(
      //     textDirection: TextDirection.rtl, // Set global RTL direction
      //     child: child!,
      //   );
      // },
    
    );
  }
}

