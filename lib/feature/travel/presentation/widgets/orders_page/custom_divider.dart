import 'package:flutter/material.dart';
import 'package:lailaty/core/resources/color_manager.dart';

class CustomDivider extends StatelessWidget {
  final bool isNotShrink;
  const CustomDivider({
    super.key,
    this.isNotShrink = true,
  });

  @override
  Widget build(BuildContext context) {
    return isNotShrink
        ? const Divider(
            indent: 5,
            endIndent: 5,
            color: ColorManager.boldyellow,
          )
        : const SizedBox.shrink();
  }
}
