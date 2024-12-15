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

class CarInfoView extends StatelessWidget {
  const CarInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        ispop: true,
        title: "معلومات السيارة",
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
                  widthOfExpansionTile: MediaQuery.of(context).size.width / 1.5,
                  text: StringManager.typeOfCar,
                  textOfOption: StringManager.krolla,
                ),
                 textWithExpansionTile(
                  widthOfExpansionTile: MediaQuery.of(context).size.width / 1.5,
                  text: StringManager.typeGeerOfCar,
                  textOfOption: StringManager.autoGeer,
                ),
                 textWithExpansionTile(
                  widthOfExpansionTile: MediaQuery.of(context).size.width / 1.5,
                  text: StringManager.numberOfChairsInCars,
                  textOfOption: StringManager.fourChairs,
                ),
                HeaderText(
                  text: StringManager.photoCar,
                  styleOfText:
                      StyleManager.normalText18(color: ColorManager.black),
                ),
                const sizedBox50(),
                addPhotoWidget(
                  onPressed: () {},
                  numberOfAddPhotoContainer: 1,
                  styleOfText:
                      StyleManager.smallBlackText16(color: ColorManager.black),
                  title: StringManager.addFrontphotoCar,
                ),
                FittedBox(
                  fit: BoxFit.cover,
                  child: addPhotoWidget(
                    onPressed: () {},
                    numberOfAddPhotoContainer: 2,
                    styleOfText: StyleManager.smallBlackText16(
                        color: ColorManager.black),
                    title: StringManager.addAroundphotoCar,
                  ),
                ),
                FittedBox(
                  fit: BoxFit.cover,
                  child: addPhotoWidget(
                    onPressed: () {},
                    numberOfAddPhotoContainer: 1,
                    styleOfText: StyleManager.smallBlackText16(
                        color: ColorManager.black),
                    title: StringManager.addInsidephotoCar,
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
                TextWithButtonWidget(
                    onPress: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EditingCar(),
                          ));
                    },
                    text: StringManager.editingCar,
                    textbutton: StringManager.pressHere,
                    styleOfButtonText: StyleManager.smallBlackText16(
                        color: ColorManager.boldyellow),
                    styleOfNormalText: StyleManager.smallBlackText16()),
                const sizedBox50(),
                acceptButtonCustomer(
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
