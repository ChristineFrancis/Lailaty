import 'package:flutter/material.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/pages/privacy_and_age_page.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/widgets/lailaty_arabic_and_english.dart';
import 'package:lailaty/core/resources/color_manager.dart';
import 'package:flutter/services.dart';
class SplashPage extends StatefulWidget {
   SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>with SingleTickerProviderStateMixin {
  @override
  @override
void initState() {
  super.initState();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  Future.delayed(Duration(seconds:2), () {
    Navigator.of(context).pushReplacement(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => PrivacyAndAgePage(),
        transitionDuration: Duration(milliseconds: 800), 
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
        child: child,
          );
        },
      ),
    );
  });
}
 @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky , overlays: SystemUiOverlay.values);
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: ColorManager.grey,
        body: LailatyArabicAndEnglish(),
        
      ),
    );
  }
}