import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lailaty/core/resources/asset_manager.dart';
import 'package:lailaty/core/resources/color_manager.dart';
import 'package:flutter/services.dart';
import 'package:lailaty/main.dart'; 

class SplashPage extends StatefulWidget {
   SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>with SingleTickerProviderStateMixin {
  @override
  // void initState() {
  //   super.initState();
  //   SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  //   Future.delayed(Duration(seconds: 5), () {
  //     Navigator.of(context).pushAndRemoveUntil(
  //           MaterialPageRoute(builder: (_) => MyHomePage(title: 'Flutter Demo Home Page'),),
  //            (route)=>false);
  //   },);
  // }
  @override
void initState() {
  super.initState();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  Future.delayed(Duration(seconds:2), () {
    Navigator.of(context).pushReplacement(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => MyHomePage(title: 'Flutter Demo Home Page'),
        transitionDuration: Duration(milliseconds: 800), // Animation duration
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
    return Scaffold(
      backgroundColor: ColorManager.grey,
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: 
              [
                SvgPicture.asset(ImageAssetManager.lettersLY),
                SizedBox(width: 3,),
                SvgPicture.asset(ImageAssetManager.lailaty),
              ],
            ),
            SizedBox(height: 3,),
            SvgPicture.asset(ImageAssetManager.lailatyArabic),
          ],
        ),
      ),
    );
  }
}