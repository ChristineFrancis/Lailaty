import 'package:flutter/material.dart';
import 'package:lailaty/core/resources/color_manager.dart';
import 'package:lailaty/core/resources/string_manager.dart';
import 'package:lailaty/core/utils/build_context_extensions.dart';

import 'package:lailaty/feature/agree_pages/presentation/widgets/personal_Information_page/details_text_widget.dart';
import 'package:lailaty/feature/agree_pages/presentation/widgets/personal_Information_page/image_picker_place_holder.dart';
import 'package:lailaty/feature/agree_pages/presentation/widgets/personal_Information_page/title_for_details_widget.dart';
import 'package:lailaty/core/viewmodels/personal_information_view.dart';


class DriverLicenseImageWidget extends StatelessWidget {
  final PersonalInformationView viewModel;
  final String sectionIdFront;
  final String sectionIdBack;

  const DriverLicenseImageWidget({
    super.key,
    required this.viewModel,
    required this.sectionIdFront,
    required this.sectionIdBack,
  });

  @override
  Widget build(BuildContext context) {
    final selectedFrontImage = viewModel.getImage(sectionIdFront);
    final selectedBackImage = viewModel.getImage(sectionIdBack);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      width: context.screenWidth,
      //height: context.screenHeight * 0.35,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(12),
          bottomRight: Radius.circular(12),
        ),
        border: Border(
          bottom: BorderSide(
            width: 2,
            color: ColorManager.shadowColor,
          ),
        ),
      ),
      child: Column(
        children: [
          const TitleForDetailsWidget(
            title: StringManager.driverLicenseImage,
          ),
          const DetailsText(
            text: StringManager.addFrontphotoCar,
          ),
          const DetailsText(
            text: StringManager.addBackphotoCar,
          ),
          SizedBox(
            height: context.screenHeight * 0.02,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ImagePickerPlaceHolder(
                noImgeWidget: Icon(
                  Icons.photo_camera_back,
                  size: context.screenWidth * 0.08,
                  color: ColorManager.grey1,
                ),
                width: context.screenWidth * 0.3,
                height:
                    context.screenWidth * 0.3, //context.screenHeight * 0.18,
                hasImage: selectedFrontImage == null,
                imageFile: selectedFrontImage,
                onTap: () async {
                  try {
                    await viewModel.pickImage(sectionIdFront);
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Failed to pick an image: $e')),
                    );
                  }
                },
              ),
              ImagePickerPlaceHolder(
                noImgeWidget: Icon(
                  Icons.photo_camera_back,
                  size: context.screenWidth * 0.08,
                  color: ColorManager.grey1,
                ),
                width: context.screenWidth * 0.3,
                height:
                    context.screenWidth * 0.3, //context.screenHeight * 0.18,
                hasImage: selectedBackImage == null,
                imageFile: selectedBackImage,
                onTap: () async {
                  try {
                    await viewModel.pickImage(sectionIdBack);
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Failed to pick an image: $e')),
                    );
                  }
                },
              ),
            ],
          ),
          SizedBox(
            height: context.screenHeight * 0.03,
          )
        ],
      ),
    );
  }
}
