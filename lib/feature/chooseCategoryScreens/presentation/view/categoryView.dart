import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lailaty/core/config/widget/Titles.dart';
import 'package:lailaty/core/config/widget/my_sized_box.dart';
import 'package:lailaty/core/config/widget/textWithExpansionTile.dart';
import 'package:lailaty/core/resources/asset_manager.dart';
import 'package:lailaty/core/resources/string_manager.dart';
import 'package:lailaty/core/resources/style_maneger.dart';

import '../../../../core/config/widget/accept_button_customer.dart';
import '../../../../core/config/widget/custom_appbar.dart';
import '../../../../core/config/widget/textWithButon.dart';
import '../../../../core/resources/color_manager.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    num heightScreen = MediaQuery.of(context).size.height;
    num widthScreen = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: CustomAppbar(
        ispop: true,
        title: StringManager.showCategoryCars,
      ),
      body: Directionality(
          textDirection: TextDirection.rtl,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: ColorManager.greyTextr,
                        borderRadius: BorderRadius.circular(12)),
                    width: widthScreen / 2,
                    // height: heightScreen / 3,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            ImageAssetManager.drivingEduCarPic,
                            height: heightScreen / 20,
                            width: widthScreen / 20,
                          ),
                          HeaderText(
                              text: StringManager.drivinglearn,
                              styleOfText: StyleManager.normalText18(
                                  size: 16, color: ColorManager.boldyellow)),
                          HeaderText(
                              text: StringManager.conntentOfdriving,
                              styleOfText: StyleManager.smallBlackText16()),
                          const sizedBox40(),
                          acceptButtonCustomer(
                            width: MediaQuery.of(context).size.width / 4,
                            height: MediaQuery.of(context).size.height / 25,
                            text: StringManager.rigester,
                            onPress: () {},
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
