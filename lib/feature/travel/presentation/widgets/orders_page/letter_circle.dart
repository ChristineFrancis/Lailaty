import 'package:flutter/material.dart';
import 'package:lailaty/core/resources/color_manager.dart';
import 'package:lailaty/core/utils/build_context_extensions.dart';

class LetterCircle extends StatelessWidget {
  final Color backGroundColor;
  final String letter;
  final double? radius;
  const LetterCircle({
    super.key,
    required this.backGroundColor,
    required this.letter,
    this.radius,
  });

  @override
  Widget build(BuildContext context) {
    double finalRadius = radius ?? context.screenWidth * 0.04;

    return CircleAvatar(
      radius: finalRadius,
      backgroundColor: backGroundColor,
      child: Center(
        child: Text(
          letter,
          style: TextStyle(
            color: ColorManager.backGroundColor,
            fontSize: context.screenWidth * 0.04,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
