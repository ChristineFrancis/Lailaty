
import 'package:flutter/material.dart';
import 'package:lailaty/core/resources/asset_manager.dart';
import 'package:lailaty/core/resources/color_manager.dart';
import 'package:lailaty/core/resources/string_manager.dart';
import 'package:lailaty/feature/choose_category_page/presentation/widgets/category_card_with_shadow.dart';
import 'package:lailaty/feature/choose_category_page/presentation/widgets/category_selected_card.dart';

class thirdRowOfCategoryView extends StatelessWidget {
   thirdRowOfCategoryView({
    super.key,
    required this.widthScreen,
    required this.heightScreen,
    required this.isRegister,
   required  this.modeOnPress,
    required this.travellingOnPress,
  });

  final num widthScreen;
  final num heightScreen;
  final List isRegister;
    void Function() travellingOnPress;
  void Function() modeOnPress;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        CategorySelectedCardWithoutShadow(
          colorCard: ColorManager.greyTextr,
          widthScreen: widthScreen,
          heightScreen: heightScreen,
          imageName: ImageAssetManager.sedancar,
          titleCategory: StringManager.onYourMode,
          contentOfCard: StringManager.conntentOfrideMode,
          isRegister: isRegister[4],
          onPressRegister: modeOnPress
        ),
        CategorySelectedCardWithShadow(
          colorCard: ColorManager.greyTextr,
          widthScreen: widthScreen,
          heightScreen: heightScreen,
          imageName: ImageAssetManager.rideCar,
          titleCategory: StringManager.travelTitle,
          contentOfCard: StringManager.conntentOfridetraveling,
          isRegister: isRegister[5],
          onPressRegister:travellingOnPress,
          colorShadow: ColorManager.yellowAccent,
          valuePerHundred: "0 %",
          titleUnderValue: StringManager.withoutCost,
          colorButton: ColorManager.yellowAccent,
        ),
      ],
    );
  }
}
