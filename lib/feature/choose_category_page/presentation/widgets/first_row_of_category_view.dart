import 'package:flutter/material.dart';
import 'package:lailaty/core/resources/asset_manager.dart';
import 'package:lailaty/core/resources/color_manager.dart';
import 'package:lailaty/core/resources/string_manager.dart';
import 'package:lailaty/feature/choose_category_page/presentation/widgets/category_selected_card.dart';

class FirstRowOfCategoryView extends StatelessWidget {
   FirstRowOfCategoryView({
    super.key,
    required this.widthScreen,
    required this.heightScreen,
    required this.isRegister,
    required this.drivingOnPress,
    required this.weddingOnPress,
  });

  final num widthScreen;
  final num heightScreen;
  final List isRegister;
  void Function() drivingOnPress;
  void Function() weddingOnPress;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        CategorySelectedCardWithoutShadow(
          colorCard: ColorManager.greyTextr,
          widthScreen: widthScreen,
          heightScreen: heightScreen,
          imageName: ImageAssetManager.drivingEduCarPic,
          titleCategory: StringManager.drivinglearn,
          contentOfCard: StringManager.conntentOfdriving,
          isRegister: isRegister[0],
          onPressRegister: drivingOnPress,
        ),
        CategorySelectedCardWithoutShadow(
          colorCard: ColorManager.greyTextr,
          widthScreen: widthScreen,
          heightScreen: heightScreen,
          imageName: ImageAssetManager.weddingCar,
          titleCategory: StringManager.widding,
          contentOfCard: StringManager.conntentOfwidding,
          isRegister: isRegister[1],
          onPressRegister: weddingOnPress,
        ),
      ],
    );
  }
}
