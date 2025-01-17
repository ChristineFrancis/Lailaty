import 'package:flutter/material.dart';
import 'package:lailaty/core/resources/color_manager.dart';
import 'package:lailaty/core/resources/string_manager.dart';
import 'package:lailaty/core/utils/build_context_extensions.dart';
import 'package:lailaty/core/viewmodels/personal_information_view.dart';
import 'package:lailaty/feature/agreeScreens/presentation/widgets/personal_Information_page/details_text_widget.dart';
import 'package:lailaty/feature/agreeScreens/presentation/widgets/personal_Information_page/image_picker_place_holder.dart';
import 'package:lailaty/feature/agreeScreens/presentation/widgets/personal_Information_page/no_image_placeholder_widget.dart';
import 'package:lailaty/feature/agreeScreens/presentation/widgets/personal_Information_page/title_for_details_widget.dart';

class PersonalImageWidget extends StatelessWidget {
  const PersonalImageWidget({
    super.key,
    required this.viewModel,
    required this.sectionId,
  });

  final PersonalInformationView viewModel;
  final String sectionId;
  @override
  Widget build(BuildContext context) {
    final selectedImage = viewModel.getImage(sectionId);
    return Container(
      margin: const EdgeInsets.all(20),
      width: context.screenWidth,
      // height: context.screenHeight * 0.35,
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
            title: StringManager.personalImage,
          ),
          SizedBox(
            height: context.screenHeight * 0.02,
          ),
          ImagePickerPlaceHolder(
            noImgeWidget: const NoImagePlaceholderWidget(),
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
          const DetailsText(
            text: StringManager.clearFace,
          ),
          const DetailsText(
            text: StringManager.goodLighting,
          ),
          const DetailsText(
            text: StringManager.noFilters,
          ),
          SizedBox(
            height: context.screenHeight * 0.03,
          )
        ],
      ),
    );
  }
}
