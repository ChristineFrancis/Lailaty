import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lailaty/core/config/presentation/widget/Titles.dart';

import 'package:lailaty/core/config/presentation/widget/custom_appbar.dart';

import 'package:lailaty/core/config/presentation/widget/my_sized_box.dart';

import 'package:lailaty/core/config/presentation/widget/textWithButon.dart';
import 'package:lailaty/core/resources/color_manager.dart';
import 'package:lailaty/core/resources/string_manager.dart';
import 'package:lailaty/core/resources/style_maneger.dart';

import 'package:lailaty/feature/agree_pages/presentation/widgets/car_info_page/my_container_with_bottom_border.dart';
import 'package:lailaty/feature/agree_pages/presentation/widgets/motor_info_page/add_motor_photo_widget.dart';
import 'package:lailaty/core/viewmodels/personal_information_view.dart';

import 'package:provider/provider.dart';

import '../../../../core/config/presentation/widget/accept_button_customer.dart';
import '../../../../core/config/presentation/widget/textWithExpansionTile.dart';
import '../../../../core/resources/key_manager.dart';
import '../widgets/motor_info_page/add_photo_licence_motor.dart';

class MotorInfoView extends StatelessWidget {
  const MotorInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<PersonalInformationView>();
    return Scaffold(
      backgroundColor: ColorManager.backGroundColor,
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
                myContainerWithBottomBorder(
                  contentWidget: Column(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: HeaderText(
                          text: StringManager.photoMotor,
                          styleOfText: StyleManager.normalText18(
                              color: ColorManager.black),
                        ),
                      ),
                      const sizedBox50(),
                      addMotorPhotoWidget(
                          viewModel: viewModel,
                          selectedPhoto:
                              viewModel.getImage(AppKeys.motorPhoto)),
                      const sizedBox50(),
                    ],
                  ),
                ),
                myContainerWithBottomBorder(
                  contentWidget: Column(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: HeaderText(
                          text: StringManager.photoLecienceCar,
                          styleOfText: StyleManager.normalText18(
                              color: ColorManager.black),
                        ),
                      ),
                      const sizedBox50(),
                      addLecienceMotorPhotoWidget(
                        viewModel: viewModel,
                        selectedFrontPhoto:
                            viewModel.getImage(AppKeys.frontMotorLicence),
                        selectedBackPhoto:
                            viewModel.getImage(AppKeys.backMotorLicence),
                      ),
                      const sizedBox50(),
                    ],
                  ),
                ),
                TextWithButtonWidget(
                    onPress: () {},
                    text: StringManager.connectToserviceOfClients,
                    textbutton: StringManager.serviceOfCleints,
                    styleOfButtonText: StyleManager.smallBlackText16(
                        color: ColorManager.blueTextColor),
                    styleOfNormalText: StyleManager.smallBlackText16()),
                const sizedBox50(),
                acceptButtonCustomer(
                  text: StringManager.tam,
                  onPress: () {
                   if(viewModel.validateImagesInMotorInfoView(context)){
                     context.push(AppKeys.noticeToDriverPath);
                   }else{
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text(StringManager.uploadAllImages)));
                   }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
