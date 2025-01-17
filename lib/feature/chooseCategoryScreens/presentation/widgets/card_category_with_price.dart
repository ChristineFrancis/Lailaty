import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lailaty/core/config/widget/Titles.dart';
import 'package:lailaty/core/config/widget/my_sized_box.dart';
import 'package:lailaty/core/resources/color_manager.dart';
import 'package:lailaty/core/resources/string_manager.dart';
import 'package:lailaty/core/resources/style_maneger.dart';
import 'package:lailaty/feature/chooseCategoryScreens/presentation/widgets/accept_button_text_switch_to_icon.dart';

class cardCategoryWithPrice extends StatelessWidget {
  cardCategoryWithPrice({
    super.key,
    required this.heightScreen,
    required this.widthScreen,
    required this.carNameAsset,
    required this.carTypeText,
    required this.onPress,
    required this.priceCategory,
  });

  final num heightScreen;
  final num widthScreen;
  void Function() onPress;
  String priceCategory;
  String carTypeText;
  String carNameAsset;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: ColorManager.greyTextr,
          borderRadius: BorderRadius.circular(12)),
      width: widthScreen / 2.3,
      // height: heightScreen / 3.2,
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Column(
                  children: [
                    SvgPicture.asset(
                      carNameAsset,
                      height: heightScreen / 28,
                      width: widthScreen / 28,
                    ),
                    HeaderText(
                        text: carTypeText,
                        styleOfText: StyleManager.miniSmallText14(
                          fontWeight: FontWeight.w700,
                          size: 11,
                        )),
                    HeaderText(
                        text: StringManager.minProceForWeddingBussinesman,
                        styleOfText: StyleManager.grySmallText12(
                          fontWeight: FontWeight.w500,
                          size: 11,
                        )),
                    HeaderText(
                        text: priceCategory,
                        textDirection: TextDirection.ltr,
                        styleOfText: StyleManager.smallBlackText16(
                          size: 13,
                        )),
                    acceptButtonCustomerWithSwitchIcon(
                      width: widthScreen / 4,
                      height: heightScreen / 28,
                      isRegister: false,
                      onPress: onPress,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
