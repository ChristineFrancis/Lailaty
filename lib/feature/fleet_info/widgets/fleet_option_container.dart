import 'package:flutter/material.dart';
import 'package:lailaty/core/resources/color_manager.dart';
import 'package:lailaty/core/resources/style_maneger.dart';
import 'package:lailaty/core/utils/build_context_extensions.dart';

class FleetOptionContainer extends StatelessWidget {
  final void Function() onTap;
  final String optionTitle;
  final IconData optionIcon;
  const FleetOptionContainer({
    super.key,
    required this.onTap,
    required this.optionTitle,
    required this.optionIcon,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          border: Border.all(
            color: ColorManager.grey1,
            width: 1.5,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              optionTitle,
              style:
                  StyleManager.normalText18(size: context.screenWidth * 0.045),
            ),
            SizedBox(
              width: context.screenWidth * 0.02,
            ),
            Icon(
              optionIcon,
              color: ColorManager.black,
              size: context.screenWidth * 0.08,
            ),
          ],
        ),
      ),
    );
  }
}
