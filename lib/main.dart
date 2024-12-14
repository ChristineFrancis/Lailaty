import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lailaty/client%20features/feature1/presentation/ui/pages/map_and_order_details_page.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/pages/start_your_journey_page15.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/pages/user_info_page.dart';
import 'package:lailaty/common%20features/splash/splash_page.dart';
import 'package:device_preview/device_preview.dart';

// void main() => runApp(
//   MyApp(),
// );


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
      home: MapAndOrderDetails(),
    );
  }
}
