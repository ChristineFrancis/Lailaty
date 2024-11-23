import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lailaty/core/resources/asset_manager.dart';

class LogoWithLaylaty extends StatelessWidget {
  const LogoWithLaylaty({super.key});

  @override
  Widget build(BuildContext context) {
    // Get screen width
    double screenWidth = MediaQuery.of(context).size.width;

    // Adjust size factors based on screen width
    double svgHeight = screenWidth * 0.1; // 10% of screen width
    double svgWidth = screenWidth * 0.15; // 15% of screen width
    double spacing = screenWidth * 0.02; // 2% of screen width

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          ImageAssetManager.lettersLY,
          height: svgHeight,
          width: svgWidth,
        ),
        SizedBox(width: spacing), // Responsive spacing
        SvgPicture.asset(
          ImageAssetManager.lailaty,
          height: svgHeight,
          width: svgWidth,
        ),
      ],
    );
  }
}
