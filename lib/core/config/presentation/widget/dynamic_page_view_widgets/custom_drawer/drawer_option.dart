import 'package:flutter/material.dart';
import 'package:lailaty/core/resources/color_manager.dart';
import 'package:lailaty/core/resources/style_maneger.dart';
import 'package:lailaty/core/utils/build_context_extensions.dart';

class DrawerOption extends StatelessWidget {
  final IconData icon;
  final String text;
  final void Function()? onTap;
  const DrawerOption({
    super.key,
    required this.icon,
    required this.text,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            text,
            style: StyleManager.boldTextStyle24(
              size: context.screenWidth * 0.04,
              color: ColorManager.black,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Icon(
            icon,
            color: ColorManager.black,
            size: context.screenWidth * 0.08,
          ),
        ],
      ),
    );
  }
}
