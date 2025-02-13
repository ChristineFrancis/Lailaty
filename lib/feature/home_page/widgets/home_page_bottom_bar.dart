import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lailaty/core/config/presentation/widget/set_container_in_bottom_bar.dart';
import 'package:lailaty/core/resources/asset_manager.dart';
import 'package:lailaty/core/resources/color_manager.dart';
import 'package:lailaty/core/resources/string_manager.dart';

BottomNavigationBar homePageBottomBar(
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
      // selectedLabelStyle: TextStyle(color: Colors.amber),
      items: <BottomNavigationBarItem>[
        buildBarItem(
            SvgPicture.asset(
              ImageAssetManager.walletIcon,
              height: MediaQuery.of(context).size.height / 33,
              width: MediaQuery.of(context).size.width / 33,
            ),
            StringManager.wallet,
            0,
            currentIndex),
        buildBarItem(
            SvgPicture.asset(
              ImageAssetManager.arrowIcon,
              height: MediaQuery.of(context).size.height / 33,
              width: MediaQuery.of(context).size.width / 33,
            ),
            StringManager.performance,
            1,
            currentIndex),
        buildBarItem(
            SvgPicture.asset(
              ImageAssetManager.carIcon,
              height: MediaQuery.of(context).size.height / 33,
              width: MediaQuery.of(context).size.width / 33,
            ),
            StringManager.orders,
            2,
            currentIndex),
      ]);
}
