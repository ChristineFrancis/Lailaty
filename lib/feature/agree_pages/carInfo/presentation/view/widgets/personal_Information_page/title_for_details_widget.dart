import 'package:flutter/material.dart';
import 'package:lailaty/core/resources/color_manager.dart';
import 'package:lailaty/core/utils/build_context_extensions.dart';

class TitleForDetailsWidget extends StatelessWidget {
  final String title;
  const TitleForDetailsWidget({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: context.screenWidth * 0.05,
        fontWeight: FontWeight.bold,
        color: ColorManager.black,
      ),
    );
  }
}
