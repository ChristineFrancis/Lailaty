import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/pages/login_page.dart';
import 'package:lailaty/core/ui/splash_video/splash_video.dart';
import 'package:lailaty/core/config/storage/dependency_injection.dart' as di;

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

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => MyApp(),
    ),
  );
}

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
      home: SplashVideo(),
    );
  }
}
