import 'package:flutter/material.dart';
import 'package:lailaty/core/resources/color_manager.dart';
import 'package:lailaty/core/utils/build_context_extensions.dart';

class SelectableContainer extends StatelessWidget {
  final bool isSelected;
  final String text;
  final VoidCallback onTap;

  const SelectableContainer({
    super.key,
    required this.isSelected,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: context.screenHeight * 0.05,
        width: context.screenWidth * 0.3,
        decoration: BoxDecoration(
          color: isSelected ? ColorManager.grey1 : ColorManager.backGroundColor,
          border: Border.all(color: ColorManager.grey1, width: 2),
          borderRadius: BorderRadius.circular(15),
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: TextStyle(
            fontSize: context.screenHeight * 0.025,
            color: isSelected ? ColorManager.whiteColor : ColorManager.black,
          ),
        ),
      ),
    );
  }
}
