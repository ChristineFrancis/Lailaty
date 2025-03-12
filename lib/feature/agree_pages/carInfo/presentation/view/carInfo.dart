// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lailaty/core/config/presentation/widget/Titles.dart';
import 'package:lailaty/core/config/presentation/widget/custom_appbar.dart';
import 'package:lailaty/core/config/presentation/widget/myButton.dart';
import 'package:lailaty/core/config/presentation/widget/my_sized_box.dart';
import 'package:lailaty/core/config/presentation/widget/textWithButon.dart';
import 'package:lailaty/core/config/presentation/widget/text_with_textfield.dart';
import 'package:lailaty/core/resources/color_manager.dart';
import 'package:lailaty/core/resources/key_manager.dart';
import 'package:lailaty/core/resources/string_manager.dart';
import 'package:lailaty/core/resources/style_maneger.dart';
import 'package:lailaty/core/viewmodels/image_picker_cubit/image_pick_cubit.dart';
import 'package:lailaty/feature/agree_pages/carInfo/presentation/view/editingCar.dart';
import 'package:lailaty/feature/agree_pages/presentation/widgets/car_info_page/add_back_car_photo_widget.dart';
import 'package:lailaty/feature/agree_pages/presentation/widgets/car_info_page/add_car_lecience_photo.dart';
import 'package:lailaty/feature/agree_pages/presentation/widgets/car_info_page/add_inner_car_photo_widget.dart';
import 'package:lailaty/feature/agree_pages/presentation/widgets/car_info_page/add_left_car_photo_widget%20copy%203.dart';
import 'package:lailaty/feature/agree_pages/presentation/widgets/car_info_page/add_right_car_photo_widget%20copy.dart';

import 'package:provider/provider.dart';
import '../../../../../core/config/presentation/widget/accept_button_customer.dart';
import '../../../../../core/config/presentation/widget/textWithExpansionTile.dart';
import '../../../../../core/viewmodels/personal_information_view.dart';
import '../../../presentation/widgets/car_info_page/add_front_car_photo_widget copy 2.dart';
import '../../../presentation/widgets/car_info_page/my_container_with_bottom_border.dart';

class CarInfoView extends StatelessWidget {
  final VoidCallback? onNavigate;
  const CarInfoView({
    Key? key,
    this.onNavigate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController colorController = TextEditingController();
    TextEditingController plateController = TextEditingController();
    final viewModel = context.watch<PersonalInformationCubit>();
    return Scaffold(
      backgroundColor: ColorManager.backGroundColor,
      appBar: CustomAppbar(
        ispop: true,
        title: StringManager.carInfo,
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
                  text: StringManager.typeOfCar,
                  textOfOption: StringManager.krolla,
                ),
                textWithExpansionTile(
                  widthOfExpansionTile: MediaQuery.of(context).size.width / 2,
                  text: StringManager.typeGeerOfCar,
                  textOfOption: StringManager.autoGeer,
                ),
                textWithExpansionTile(
                  widthOfExpansionTile: MediaQuery.of(context).size.width / 2,
                  text: StringManager.numberOfChairsInCars,
                  textOfOption: StringManager.fourChairs,
                ),
                TextWithTextfield(
                    controller: plateController,
                    text: StringManager.plateNumber,
                    textOfOption: "12324"),
                TextWithTextfield(
                    controller: colorController,
                    text: StringManager.carColor,
                    textOfOption: " أبيض"),
                myContainerWithBottomBorder(
                  contentWidget: Column(
                    children: [
                      HeaderText(
                          text: StringManager.editingCar,
                          styleOfText: StyleManager.smallBlackText16()),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: MyButton(
                            title: StringManager.pressHere,
                            onpress: () {
                              context.push(AppKeys.editingCarPage);
                            },
                            colors: ColorManager.semiBoldyellow,
                            width: MediaQuery.of(context).size.width / 3.2,
                            height: MediaQuery.of(context).size.height / 16,
                            radius: 11,
                            styleOfTExt: StyleManager.smallBlackText16()),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.center,
                    child: HeaderText(
                      text: StringManager.photoCar,
                      styleOfText:
                          StyleManager.normalText18(color: ColorManager.black),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Align(
                    alignment: Alignment.center,
                    child: HeaderText(
                      text: StringManager.addphotoCar,
                      styleOfText: StyleManager.smallBlackText16(
                          color: ColorManager.black),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: HeaderText(
                    text: StringManager.photosCar,
                    styleOfText:
                        StyleManager.miniSmallText14(color: ColorManager.black),
                  ),
                ),
                myContainerWithBottomBorder(
                    contentWidget: Column(
                  children: [
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          addBackCarPhotoWidget(
                            viewModel: viewModel,
                            selectedPhoto: viewModel.getImage(AppKeys.carBack),
                          ),
                          const SizedBox(
                            width: 3,
                          ),
                          addFrontCarPhotoWidget(
                            viewModel: viewModel,
                            selectedPhoto: viewModel.getImage(AppKeys.carFront),
                          ),
                          const SizedBox(
                            width: 3,
                          ),
                          addInnerCarPhotoWidget(
                            viewModel: viewModel,
                            selectedPhoto: viewModel.getImage(AppKeys.carInner),
                          ),
                        ],
                      ),
                    ),
                    const sizedBox50(),
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          addLeftCarPhotoWidget(
                            viewModel: viewModel,
                            selectedPhoto: viewModel.getImage(AppKeys.carleft),
                          ),
                          const SizedBox(
                            width: 3,
                          ),
                          addRightCarPhotoWidget(
                            viewModel: viewModel,
                            selectedPhoto: viewModel.getImage(AppKeys.carRight),
                          ),
                        ],
                      ),
                    ),
                    const sizedBox50(),
                  ],
                )),
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
                    Align(
                      alignment: Alignment.center,
                      child: HeaderText(
                        text: StringManager.photoFrontBackLecienceCar,
                        styleOfText: StyleManager.miniSmallText14(
                            color: ColorManager.black),
                      ),
                    ),
                    const sizedBox50(),
                    addLeciencePhotoWidget(
                        viewModel: viewModel,
                        selectedFrontPhoto:
                            viewModel.getImage(AppKeys.frontLecienceCar),
                        selectedBackPhoto:
                            viewModel.getImage(AppKeys.backLecienceCar)),
                    const sizedBox50()
                  ],
                )),
                Center(
                  child: TextWithButtonWidget(
                      onPress: () {},
                      text: StringManager.connectToserviceOfClients,
                      textbutton: StringManager.serviceOfCleints,
                      styleOfButtonText: StyleManager.smallBlackText16(
                          color: ColorManager.blueTextColor),
                      styleOfNormalText: StyleManager.smallBlackText16()),
                ),
                const sizedBox50(),
                acceptButtonCustomer(
                  text: StringManager.tam,
                  onPress: () {
                    if (

                        //viewModel.validateImagesInCarInfoView(context)
                        viewModel.getImage(AppKeys.frontLecienceCar) != null &&
                            viewModel.getImage(AppKeys.backLecienceCar) !=
                                null &&
                            viewModel.getImage(AppKeys.carBack) != null &&
                            viewModel.getImage(AppKeys.carFront) != null &&
                            viewModel.getImage(AppKeys.carInner) != null &&
                            viewModel.getImage(AppKeys.carRight) != null &&
                            viewModel.getImage(AppKeys.carleft) != null) {
                      if (onNavigate != null) {
                        onNavigate!();
                      } else {
                        context.push(AppKeys.noticeToDriverPath);
                      }
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            StringManager.uploadAllImages,
                            textAlign: TextAlign.right,
                          ),
                        ),
                      );
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
