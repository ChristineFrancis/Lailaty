import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lailaty/core/resources/color_manager.dart';

import '../../../../core/config/presentation/widget/Titles.dart';
import '../../../../core/config/presentation/widget/my_sized_box.dart';

import '../../../../core/resources/style_maneger.dart';
import 'accept_button_text_switch_to_icon.dart';

class CategorySelectedCardWithoutShadow extends StatelessWidget {
  CategorySelectedCardWithoutShadow({
    super.key,
    required this.widthScreen,
    required this.heightScreen,
    required this.isRegister,
    required this.onPressRegister,
    required this.titleCategory,
    required this.imageName,
    required this.contentOfCard,
    required this.colorCard,
  });

  final num widthScreen;
  final num heightScreen;
  final bool isRegister;
  void Function() onPressRegister;
  String contentOfCard;

  String imageName;
  String titleCategory;

  Color colorCard;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: colorCard, borderRadius: BorderRadius.circular(12)),
      width: widthScreen / 2.2,
      height: heightScreen / 3,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.center,
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
                          fontWeight: FontWeight.w800,
                          size: 13.4,
                        )),
                  ],
                ),
              ),
            ),
            ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: heightScreen / 10,
              ),
              child: HeaderText(
                  text: contentOfCard,
                  styleOfText: StyleManager.grySmallText12(
                      fontWeight: FontWeight.w500, size: 10)),
            ),
            acceptButtonCustomerWithSwitchIcon(
              width: MediaQuery.of(context).size.width / 4,
              height: MediaQuery.of(context).size.height / 25,
              isRegister: isRegister,
              onPress: onPressRegister,
            ),
          ],
        ),
      ),
    );
  }
}
