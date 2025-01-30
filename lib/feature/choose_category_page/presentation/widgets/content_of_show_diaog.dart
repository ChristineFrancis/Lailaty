import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lailaty/core/config/widget/Titles.dart';
import 'package:lailaty/core/config/widget/my_sized_box.dart';
import 'package:lailaty/core/resources/asset_manager.dart';
import 'package:lailaty/core/resources/color_manager.dart';

import 'package:lailaty/core/resources/string_manager.dart';
import 'package:lailaty/core/resources/style_maneger.dart';
import 'package:lailaty/feature/choose_category_page/presentation/widgets/card_category_with_price.dart';

class contentOfShowDialog extends StatelessWidget {
  contentOfShowDialog({
    super.key,
    required this.widthScreen,
    required this.heightScreen,
    required this.onPressLimozen,
    required this.onPressSidan,
    required this.onPressSuv,
    required this.onPressVipCaporleh,
    required this.onPressVipCategory,
    required this.onPresscaporleh,
    required this.onPressluxury,
    required this.priceLimozen,
    required this.priceSidan,
    required this.priceSuv,
    required this.priceVipCaporleh,
    required this.priceVipCategory,
    required this.pricecaporleh,
    required this.priceluxury,
    required this.context,
  });

  final num widthScreen;
  final num heightScreen;
  BuildContext context;
  void Function() onPressSidan;
  void Function() onPressLimozen;
  void Function() onPressVipCaporleh;
  void Function() onPressVipCategory;
  void Function() onPressluxury;
  void Function() onPresscaporleh;
  void Function() onPressSuv;
  String priceSidan;
  String priceLimozen;
  String priceVipCaporleh;
  String priceVipCategory;
  String priceluxury;
  String pricecaporleh;
  String priceSuv;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Container(
          width: widthScreen / 1.04,
          height: heightScreen / 1.02,
          decoration: BoxDecoration(
              color: ColorManager.backGroundColor,
              borderRadius: BorderRadius.circular(11)),
          child: Column(
            children: [
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: ColorManager.black),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 4, vertical: 4),
                          child: HeaderText(
                              text: StringManager.selectCategoryToYourCar,
                              styleOfText: StyleManager.normalText18()),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          context.pop();
                        },
                        child: const Icon(
                          Icons.close,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const sizedBox50(),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    cardCategoryWithPrice(
                      heightScreen: heightScreen,
                      widthScreen: widthScreen,
                      carNameAsset: ImageAssetManager.suvCar,
                      carTypeText: StringManager.suvCar,
                      priceCategory: priceSuv,
                      onPress: onPressSuv,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    cardCategoryWithPrice(
                      heightScreen: heightScreen,
                      widthScreen: widthScreen,
                      carNameAsset: ImageAssetManager.sedancar,
                      carTypeText: StringManager.sidanBigOrMiddle,
                      priceCategory: priceSidan,
                      onPress: onPressSidan,
                    )
                  ],
                ),
              ),
              const sizedBox50(),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    cardCategoryWithPrice(
                      heightScreen: heightScreen,
                      widthScreen: widthScreen,
                      carNameAsset: ImageAssetManager.limozinCarPic,
                      carTypeText: StringManager.limozenCar,
                      priceCategory: priceLimozen,
                      onPress: onPressLimozen,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    cardCategoryWithPrice(
                      heightScreen: heightScreen,
                      widthScreen: widthScreen,
                      carNameAsset: ImageAssetManager.vipCarPic,
                      carTypeText: StringManager.vipCategory,
                      priceCategory: priceVipCategory,
                      onPress: onPressVipCategory,
                    )
                  ],
                ),
              ),
              const sizedBox50(),
              cardCategoryWithPrice(
                heightScreen: heightScreen,
                widthScreen: widthScreen,
                carNameAsset: ImageAssetManager.luxuryCarPic,
                carTypeText: StringManager.luxuryCar,
                priceCategory: priceluxury,
                onPress: onPressluxury,
              ),
              const sizedBox50(),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    cardCategoryWithPrice(
                      heightScreen: heightScreen,
                      widthScreen: widthScreen,
                      carNameAsset: ImageAssetManager.vipCaporlehCarPic,
                      carTypeText: StringManager.vipCaporlia,
                      priceCategory: priceVipCaporleh,
                      onPress: onPressVipCaporleh,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    cardCategoryWithPrice(
                      heightScreen: heightScreen,
                      widthScreen: widthScreen,
                      carNameAsset: ImageAssetManager.caporlehCarPic,
                      carTypeText: StringManager.caporlia,
                      priceCategory: pricecaporleh,
                      onPress: onPresscaporleh,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
