import 'package:flutter/material.dart';
import 'package:lailaty/core/config/widget/Titles.dart';
import 'package:lailaty/core/config/widget/addPhoto.dart';
import 'package:lailaty/core/config/widget/custom_appbar.dart';
import 'package:lailaty/core/config/widget/myButton.dart';
import 'package:lailaty/core/config/widget/my_sized_box.dart';
import 'package:lailaty/core/config/widget/oneNestedExpansionTile.dart';
import 'package:lailaty/core/config/widget/textWithButon.dart';
import 'package:lailaty/core/resources/color_manager.dart';
import 'package:lailaty/core/resources/string_manager.dart';
import 'package:lailaty/core/resources/style_maneger.dart';
import 'package:lailaty/feature/agreeScreens/presentation/view/editingCar.dart';

import '../../../../core/config/widget/accept_button_customer.dart';
import '../../../../core/config/widget/textWithExpansionTile.dart';

class MotorInfoView extends StatelessWidget {
  const MotorInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        ispop: true,
        title: StringManager.motorInfo,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                textWithExpansionTile(
                  widthOfExpansionTile: MediaQuery.of(context).size.width / 2,
                  text: StringManager.yearMade,
                  textOfOption: "1970",
                ),
                const sizedBox50(),
                FittedBox(
                  child: addPhotoWidget(
                    onPressed: () {},
                    numberOfAddPhotoContainer: 1,
                    styleOfText: StyleManager.smallBlackText16(
                        color: ColorManager.black),
                    title: StringManager.photoMotor,
                  ),
                ),
                HeaderText(
                  text: StringManager.photoLescenceMotor,
                  styleOfText:
                      StyleManager.normalText18(color: ColorManager.black),
                ),
                FittedBox(
                  fit: BoxFit.cover,
                  child: addPhotoWidget(
                    onPressed: () {},
                    numberOfAddPhotoContainer: 1,
                    styleOfText: StyleManager.smallBlackText16(
                        color: ColorManager.black),
                    title: StringManager.addFrontphotoCar,
                  ),
                ),
                FittedBox(
                  fit: BoxFit.cover,
                  child: addPhotoWidget(
                    onPressed: () {},
                    numberOfAddPhotoContainer: 1,
                    styleOfText: StyleManager.smallBlackText16(
                        color: ColorManager.black),
                    title: StringManager.addBackphotoCar,
                  ),
                ),
                const sizedBox30(),
                TextWithButtonWidget(
                    onPress: () {},
                    text: StringManager.connectToserviceOfClients,
                    textbutton: StringManager.serviceOfCleints,
                    styleOfButtonText: StyleManager.smallBlackText16(
                        color: ColorManager.boldyellow),
                    styleOfNormalText: StyleManager.smallBlackText16()),
                acceptButtonCustomer(
                text:   StringManager.tam,
                  onPress: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
