import 'package:flutter/material.dart';
import 'package:lailaty/core/resources/color_manager.dart';
import 'package:lailaty/core/utils/build_context_extensions.dart';

class DetailsText extends StatelessWidget {
  final String text;
  const DetailsText({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: context.screenWidth * 0.04,
        fontWeight: FontWeight.w400,
        color: ColorManager.blackColor,
      ),
    );
  }
}
