import 'package:flutter/material.dart';
import 'package:lailaty/core/resources/color_manager.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Divider(
      indent: 5,
      endIndent: 5,
      color: ColorManager.boldyellow,
    );
  }
}
