import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:lailaty/core/config/widget/Titles.dart';
import 'package:lailaty/core/config/widget/my_sized_box.dart';
import 'package:lailaty/core/config/widget/textWithExpansionTile.dart';
import 'package:lailaty/core/resources/string_manager.dart';
import 'package:lailaty/core/resources/style_maneger.dart';

import '../../../../core/config/widget/accept_button_customer.dart';
import '../../../../core/config/widget/custom_appbar.dart';
import '../../../../core/config/widget/textWithButon.dart';
import '../../../../core/resources/color_manager.dart';

class EditingCar extends StatelessWidget {
  const EditingCar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                          color: ColorManager.boldyellow),
                      styleOfNormalText: StyleManager.miniSmallText14()),
                  const sizedBox50(),
                  acceptButtonCustomer(
                    onPress: () {},
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
