import 'package:flutter/material.dart';
import 'package:lailaty/core/resources/color_manager.dart';
import 'package:lailaty/core/resources/string_manager.dart';
import 'package:lailaty/core/config/presentation/widget/dynamic_page_view_widgets/bottom_nav_item.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemTapped;

  const CustomBottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kBottomNavigationBarHeight,
      decoration: BoxDecoration(
        color: ColorManager.grey1,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(5),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          BottomNavItem(
            index: 0,
            icon: Icons.history,
            label: StringManager.orderHistory,
            selectedIndex: selectedIndex,
            onTap: onItemTapped,
          ),
          BottomNavItem(
            index: 1,
            icon: Icons.directions_car_outlined,
            label: StringManager.orders,
            selectedIndex: selectedIndex,
            onTap: onItemTapped,
          ),
        ],
      ),
    );
  }
}
