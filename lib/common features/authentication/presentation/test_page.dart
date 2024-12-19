import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lailaty/core/resources/asset_manager.dart';
import 'package:lailaty/core/resources/color_manager.dart';

class TestPage extends StatelessWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    const Duration animationDuration = Duration(milliseconds: 600);
    List vis = [false, false, false, false, false];

    Widget L = SvgPicture.asset(ImageAssetManager.automaticAcceptanceIcon);
    return Container(
      color: ColorManager.grey,
      child: Stack(
        alignment: Alignment.center,
        children: [
          L
          //AnimatedPositioned(child: L, duration: animationDuration),
        ],
      ),
    );
  }
}
