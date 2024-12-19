import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lailaty/common%20features/authentication/presentation/test_page.dart';
import 'package:device_preview/device_preview.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/pages/start_your_journey_page15.dart';
/*
void main() => runApp(
      MyApp(),
    );*/

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
      home: TestPage(),
    );
  }
}
