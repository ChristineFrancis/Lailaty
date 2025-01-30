import 'package:flutter/material.dart';
import 'package:lailaty/core/utils/build_context_extensions.dart';
import 'package:lailaty/core/resources/color_manager.dart';

class BottomNavItem extends StatelessWidget {
  final int index;
  final IconData icon;
  final String label;
  final int selectedIndex;
  final ValueChanged<int> onTap;
  const BottomNavItem({
    super.key,
    required this.index,
    required this.icon,
    required this.label,
    required this.selectedIndex,
    required this.onTap,
  });

  // Color _getTextColor() {
  //   return selectedIndex == index
  //       ? ColorManager.black
  //       : ColorManager.yellowTextColor;
  // }

  Color _getContainerColor() {
    return selectedIndex == index
        ? ColorManager.yellowTextColor
        : Colors.transparent;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(index),
      child: Container(
        height: kBottomNavigationBarHeight,
        width: context.screenWidth * 0.25,
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: _getContainerColor(),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: ColorManager.black, //_getTextColor(),
            ),
            Text(
              label,
              style: const TextStyle(
                overflow: TextOverflow.ellipsis,
                color: ColorManager.black, //_getTextColor(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
