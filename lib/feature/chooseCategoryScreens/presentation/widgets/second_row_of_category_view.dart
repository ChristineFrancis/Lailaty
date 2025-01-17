
import 'package:flutter/material.dart';
import 'package:lailaty/core/resources/asset_manager.dart';
import 'package:lailaty/core/resources/color_manager.dart';
import 'package:lailaty/core/resources/string_manager.dart';
import 'package:lailaty/feature/chooseCategoryScreens/presentation/widgets/category_card_with_shadow.dart';

class SecondRowOfCategoryView extends StatelessWidget {
   SecondRowOfCategoryView({
    super.key,
    required this.widthScreen,
    required this.heightScreen,
    required this.isRegister,
    required this.rideCarOnPress,
    required this.rideMotorOnPress,
  });

  final num widthScreen;
  final num heightScreen;
  final List isRegister;
    void Function() rideCarOnPress;
  void Function() rideMotorOnPress;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        CategorySelectedCardWithShadow(
          colorCard: ColorManager.yellowAccent,
          widthScreen: widthScreen,
          heightScreen: heightScreen,
          imageName: ImageAssetManager.rideCar,
          titleCategory: StringManager.ride,
          contentOfCard: StringManager.conntentOfrideCar,
          isRegister: isRegister[2],
          onPressRegister: rideCarOnPress,
          colorShadow: ColorManager.greyTextr,
          valuePerHundred: "0 %",
          titleUnderValue: StringManager.withoutCost,
        ),
        CategorySelectedCardWithShadow(
          colorCard: ColorManager.yellowAccent,
          widthScreen: widthScreen,
          heightScreen: heightScreen,
          imageName: ImageAssetManager.rideMotor,
          titleCategory: StringManager.ride,
          contentOfCard: StringManager.conntentOfrideMotor,
          isRegister: isRegister[3],
          onPressRegister: rideMotorOnPress,
          colorShadow: ColorManager.greyTextr,
          valuePerHundred: "0 %",
          titleUnderValue: StringManager.withoutCost,
        ),
      ],
    );
  }
}
