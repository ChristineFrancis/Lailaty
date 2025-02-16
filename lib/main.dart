import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lailaty/client%20features/feature1/presentation/ui/pages/map_and_order_details_page.dart';
import 'package:device_preview/device_preview.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/pages/on_boarding.dart';
import 'package:lailaty/common%20features/chat/pages/empty_page.dart';
import 'package:lailaty/core/ui/splash_video/splash_video.dart';
import 'package:lailaty/core/ui/test_page.dart';

/*
void main() {
  // لتضل الشاشة بالطول
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);
  runApp(
    MyApp(),
  );
}
*/

void main() => runApp(
      DevicePreview(
        enabled: !kReleaseMode,
        builder: (context) => MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //  print('the widthhhhhhhhhhhhhhhhhhh');
    //   print(MediaQuery.sizeOf(context).width);
    return MaterialApp(
      // ignore: deprecated_member_use
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      // locale: const Locale('ar'),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Segeo",
      ),
      home: OnBoarding(),
    );
  }
}
