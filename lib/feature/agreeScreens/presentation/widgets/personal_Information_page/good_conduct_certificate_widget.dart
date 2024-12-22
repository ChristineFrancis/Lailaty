import 'package:flutter/material.dart';
import 'package:lailaty/core/resources/color_manager.dart';
import 'package:lailaty/core/resources/string_manager.dart';
import 'package:lailaty/core/utils/build_context_extensions.dart';
import 'package:lailaty/feature/agreeScreens/presentation/state_managment/personal_information_view.dart';
import 'package:lailaty/feature/agreeScreens/presentation/widgets/personal_Information_page/details_text_widget.dart';
import 'package:lailaty/feature/agreeScreens/presentation/widgets/personal_Information_page/image_picker_place_holder.dart';
import 'package:lailaty/feature/agreeScreens/presentation/widgets/personal_Information_page/title_for_details_widget.dart';

class GoodConductCertificateWidget extends StatelessWidget {
  final PersonalInformationView viewModel;
  final String sectionId;
  const GoodConductCertificateWidget(
      {super.key, required this.viewModel, required this.sectionId});

  @override
  Widget build(BuildContext context) {
    final selectedImage = viewModel.getImage(sectionId);

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
            title: StringManager.goodConductCertificate,
          ),
          SizedBox(
            height: context.screenHeight * 0.01,
          ),
          const DetailsText(
            text: StringManager.optionalLabel,
          ),
          SizedBox(
            height: context.screenHeight * 0.01,
          ),
          ImagePickerPlaceHolder(
            noImgeWidget: Icon(
              Icons.photo_camera_back,
              size: context.screenWidth * 0.08,
              color: ColorManager.grey1,
            ),
            width: context.screenWidth * 0.3,
            height: context.screenWidth * 0.3, //context.screenHeight * 0.18,
            hasImage: selectedImage == null,
            imageFile: selectedImage,
            onTap: () async {
              try {
                await viewModel.pickImage(sectionId);
              } catch (e) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Failed to pick an image: $e')),
                );
              }
            },
          ),
          SizedBox(
            height: context.screenHeight * 0.01,
          ),
          const DetailsText(
            text: StringManager.missingCriminalRecordMessage,
          ),
          const DetailsText(
            text: StringManager.notificationPromptMessage,
          ),
          SizedBox(
            height: context.screenHeight * 0.03,
          ),
        ],
      ),
    );
  }
}
