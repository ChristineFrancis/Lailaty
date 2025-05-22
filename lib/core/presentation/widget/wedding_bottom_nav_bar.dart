import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lailaty/core/presentation/widget/set_container_in_bottom_bar.dart';
import 'package:lailaty/core/resources/asset_manager.dart';
import 'package:lailaty/core/resources/color_manager.dart';
import 'package:lailaty/core/resources/string_manager.dart';

BottomNavigationBar CustomWeddingBottomNavBar(
    {required int currentIndex,
    required void Function(int)? onTap,
    required BuildContext context}) {
  return BottomNavigationBar(
      onTap: onTap,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      currentIndex: currentIndex,
      backgroundColor: ColorManager.grey1,
      selectedItemColor: ColorManager.yellowAccent,
      items: <BottomNavigationBarItem>[
        buildBarItem(
            Icon(
              Icons.history,
              color: ColorManager.black,
            ),
            StringManager.orderHistory,
            0,
            currentIndex),
        buildBarItem(
            Icon(
              Icons.directions_car_filled_outlined,
              color: ColorManager.black,
            ),
            StringManager.orders,
            1,
            currentIndex),
      ]);
}
