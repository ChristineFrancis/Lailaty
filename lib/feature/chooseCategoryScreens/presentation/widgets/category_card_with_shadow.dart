import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lailaty/core/config/widget/shadow_painter.dart';

import '../../../../core/config/widget/Titles.dart';
import '../../../../core/config/widget/my_sized_box.dart';
import '../../../../core/resources/asset_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/string_manager.dart';
import '../../../../core/resources/style_maneger.dart';
import 'accept_button_text_switch_to_icon.dart';

class CategorySelectedCardWithShadow extends StatelessWidget {
  CategorySelectedCardWithShadow({
    super.key,
    required this.widthScreen,
    required this.heightScreen,
    required this.isRegister,
    required this.onPressRegister,
    required this.titleCategory,
    required this.imageName,
    required this.contentOfCard,
    required this.colorCard,
    required this.colorShadow,
    required this.titleUnderValue,
    required this.valuePerHundred,
    this.colorButton,
  });

  final num widthScreen;
  final num heightScreen;
  final bool isRegister;
  void Function() onPressRegister;
  String contentOfCard;
  String titleUnderValue;
  String valuePerHundred;
  String imageName;
  String titleCategory;
  Color colorShadow;
  Color colorCard;
  Color? colorButton;
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        decoration: BoxDecoration(
            color: colorCard, borderRadius: BorderRadius.circular(12)),
        width: widthScreen / 2.2,
        height: heightScreen / 3,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Column(
                    children: [
                      SvgPicture.asset(
                        imageName,
                        height: heightScreen / 28,
                        width: widthScreen / 28,
                      ),
                      HeaderText(
                          text: titleCategory,
                          styleOfText: StyleManager.semiboldTextStyle20(
                            fontWeight: FontWeight.w700,
                            size: 13,
                          )),
                    ],
                  ),
                ),
              ),
              // const sizedBox50(),
              HeaderText(
                  text: contentOfCard,
                  styleOfText:
                      StyleManager.grySmallText12(fontWeight: FontWeight.w500)),
              const sizedBox40(),
              acceptButtonCustomerWithSwitchIcon(
                width: MediaQuery.of(context).size.width / 4,
                height: MediaQuery.of(context).size.height / 25,
                isRegister: isRegister,
                onPress: onPressRegister,
                color: colorButton ?? ColorManager.greyTextr,
              ),
            ],
          ),
        ),
      ),
      Positioned(
        top: 0,
        left: 8,
        child: CustomPaint(
          painter: ShadowPainter(
            color: colorShadow,
            context: context,
          ),
          child: Container(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height / 16.5,
              maxWidth: MediaQuery.of(context).size.width / 7,
            ),
            alignment: Alignment.centerRight,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Column(
                children: [
                  HeaderText(
                    text: valuePerHundred,
                    styleOfText: StyleManager.semiboldTextStyle20(
                        fontWeight: FontWeight.w900, size: 24),
                  ),
                  HeaderText(
                    text: titleUnderValue,
                    styleOfText: StyleManager.miniSmallText14(
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ]);
  }
}
