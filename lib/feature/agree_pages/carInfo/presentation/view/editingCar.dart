import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lailaty/core/config/presentation/widget/Titles.dart';
import 'package:lailaty/core/config/presentation/widget/my_sized_box.dart';
import 'package:lailaty/core/config/presentation/widget/textWithExpansionTile.dart';
import 'package:lailaty/core/resources/string_manager.dart';
import 'package:lailaty/core/resources/style_maneger.dart';

import '../../../../../core/config/presentation/widget/accept_button_customer.dart';
import '../../../../../core/config/presentation/widget/custom_appbar.dart';
import '../../../../../core/config/presentation/widget/textWithButon.dart';
import '../../../../../core/resources/color_manager.dart';
import '../../../../../core/resources/key_manager.dart';

class EditingCar extends StatelessWidget {
  const EditingCar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.backGroundColor,
      appBar: CustomAppbar(
        ispop: true,
        title: "معلومات السيارة",
      ),
      body: Directionality(
          textDirection: TextDirection.rtl,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  HeaderText(
                      text: StringManager.noteInEditingCar,
                      styleOfText: StyleManager.normalText18()),
                  const sizedBox30(),
                  textWithExpansionTile(
                      widthOfExpansionTile:
                          MediaQuery.of(context).size.width / 1.7,
                      text: StringManager.typeOfCar,
                      textOfOption: StringManager.krolla),
                  textWithExpansionTile(
                      widthOfExpansionTile:
                          MediaQuery.of(context).size.width / 1.7,
                      text: StringManager.editingCarToAnother,
                      textOfOption: StringManager.krolla),
                  const sizedBox30(),
                  TextWithButtonWidget(
                      onPress: () {},
                      text: StringManager.connectToserviceOfClients,
                      textbutton: StringManager.serviceOfCleints,
                      styleOfButtonText: StyleManager.miniSmallText14(
                          color: ColorManager.semiBoldyellow),
                      styleOfNormalText: StyleManager.miniSmallText14()),
                  const sizedBox50(),
                  acceptButtonCustomer(
                    text: StringManager.tam,
                    onPress: () {
                      context.push(AppKeys.noticeToDriverPath);
                    },
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
