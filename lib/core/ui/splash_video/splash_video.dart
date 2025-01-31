import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/pages/privacy_and_age_page.dart';
import 'package:lailaty/core/resources/asset_manager.dart';
import 'package:lailaty/core/resources/color_manager.dart';

class SplashVideo extends StatefulWidget {
  const SplashVideo({super.key});

  @override
  State<SplashVideo> createState() => _SplashVideoState();
}

class _SplashVideoState extends State<SplashVideo> {
  List<bool> vis = List.generate(9, (index) => false);
  int currentIndex = 0;
  Timer? timer;

  Duration animationDuration = Duration(milliseconds: 400);

  @override
  void initState() {
    super.initState();
    _startAnimation();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void _startAnimation() {
    timer = Timer.periodic(Duration(milliseconds: 750), (timer) {
      if (currentIndex < vis.length) {
        setState(() {
          vis[currentIndex] = true;
        });
        currentIndex++;

        // Navigate to PrivacyAndAgePage when vis[8] is true
        if (currentIndex == 9) {
          timer.cancel();
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => PrivacyAndAgePage()),
          );
        }
      } else {
        timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    /*return  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            vis.length,
            (index) => AnimatedContainer(
              duration: Duration(milliseconds: 500),
              width: 50,
              height: 50,
              margin: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: vis[index] ? Colors.green : Colors.grey,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
      
    );*/
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    Widget L = SvgPicture.asset(
      ImageAssetManager.lLetter,
      width: screenWidth * 0.083,
    );
    Widget Y = SvgPicture.asset(
      ImageAssetManager.yLetter,
      width: screenWidth * 0.082,
    );
    Widget lltAr = SvgPicture.asset(
      ImageAssetManager.lailatyArabic,
      width: screenWidth * 0.5,
    );
    Widget llt = SvgPicture.asset(
      ImageAssetManager.lailaty,
      width: screenWidth * 0.28,
    );
    Widget ly = SvgPicture.asset(
      ImageAssetManager.lettersLY,
      width: screenWidth * 0.27,
    );

    return Container(
      color: ColorManager.grey,
      child: Stack(
        alignment: Alignment.center,
        children: [
          //! laylaty
          AnimatedPositioned(
            bottom: screenHeight * 475 / 932,
            left: vis[6] ? screenWidth * 200 / 430 : screenWidth * 140 / 430,
            duration: animationDuration,
            child: AnimatedOpacity(
              opacity: vis[6] ? 1 : 0,
              duration: animationDuration,
              child: llt,
            ),
          ),

          //! ly
          AnimatedPositioned(
            bottom:
                vis[5] ? screenHeight * 440 / 932 : screenHeight * 420 / 932,
            left: vis[6] ? screenWidth * 95 / 430 : screenWidth * 160 / 430,
            duration: animationDuration,
            child: AnimatedScale(
              duration: animationDuration,
              scale: vis[6]
                  ? 0.7
                  : vis[5]
                      ? 0.8
                      : 1,
              child: AnimatedOpacity(
                opacity: vis[5] ? 1.0 : 0.0,
                duration: animationDuration,
                child: ly,
              ),
            ),
          ),

          //! L
          AnimatedPositioned(
            duration: animationDuration,
            curve: Curves.easeIn,
            bottom: screenHeight * 410 / 932,
            left: vis[2] ? screenWidth * 120 / 430 : -100,
            child: Visibility(visible: !vis[5], child: L),
          ),

          //! Y
          AnimatedPositioned(
              duration: animationDuration,
              curve: Curves.easeIn,
              bottom: screenHeight * 410 / 932,
              right: vis[3] ? screenWidth * 108.1 / 430 : -100,
              child: Visibility(visible: !vis[5], child: Y)),

          //! ليلتي
          AnimatedPositioned(
            duration: animationDuration,
            bottom:
                (vis[5]) ? screenHeight * 350 / 932 : screenHeight * 410 / 932,
            left: screenWidth * 107.5 / 430,
            child: AnimatedOpacity(
                opacity: vis[4] ? 1.0 : 0.0,
                duration: animationDuration,
                curve: Curves.easeIn,
                child: lltAr),
          ),
        ],
      ),
    );
  }
}



/* */