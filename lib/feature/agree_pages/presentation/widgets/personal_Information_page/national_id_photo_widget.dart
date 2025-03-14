// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:lailaty/core/resources/color_manager.dart';
import 'package:lailaty/core/resources/string_manager.dart';
import 'package:lailaty/core/utils/build_context_extensions.dart';
import 'package:lailaty/core/state_managments/image_picker_cubit/image_pick_cubit.dart';
import 'package:lailaty/feature/agree_pages/presentation/widgets/personal_Information_page/details_text_widget.dart';
import 'package:lailaty/feature/agree_pages/presentation/widgets/personal_Information_page/image_picker_place_holder.dart';
import 'package:lailaty/feature/agree_pages/presentation/widgets/personal_Information_page/title_for_details_widget.dart';

class NationalIdPhotoWidget extends StatelessWidget {
  final PersonalInformationCubit viewModel;
  final String sectionIdFront;
  final String sectionIdBack;

  const NationalIdPhotoWidget({
    super.key,
    required this.viewModel,
    required this.sectionIdFront,
    required this.sectionIdBack,
  });

  @override
  Widget build(BuildContext context) {
    // final selectedFrontImage = viewModel.getImage(sectionIdFront);
    // final selectedBackImage = viewModel.getImage(sectionIdBack);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
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
            title: StringManager.nationalIdPhoto,
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
                initialImage: viewModel.getImage(sectionIdFront),
                noImageWidget: Icon(
                  Icons.photo_camera_back,
                  size: context.screenWidth * 0.08,
                  color: ColorManager.grey1,
                ),
                width: context.screenWidth * 0.3,
                height:
                    context.screenWidth * 0.3, //context.screenHeight * 0.18,
                imageKey: sectionIdFront,
                onImageSelected: (key, image) {
                  viewModel.updateImage(key, image);
                },
                // hasImage: selectedFrontImage == null,
                // imageFile: selectedFrontImage,
                // onTap: () async {
                //   try {
                //     await viewModel.pickImage(sectionIdFront);
                //   } catch (e) {
                //     ScaffoldMessenger.of(context).showSnackBar(
                //       SnackBar(content: Text('Failed to pick an image: $e')),
                //     );
                //   }
                // },
              ),
              ImagePickerPlaceHolder(
                initialImage: viewModel.getImage(sectionIdBack),
                noImageWidget: Icon(
                  Icons.photo_camera_back,
                  size: context.screenWidth * 0.08,
                  color: ColorManager.grey1,
                ),
                width: context.screenWidth * 0.3,
                height:
                    context.screenWidth * 0.3, // context.screenHeight * 0.18,
                imageKey: sectionIdBack,
                onImageSelected: (key, image) {
                  viewModel.updateImage(key, image);
                },
                // hasImage: selectedBackImage == null,
                // imageFile: selectedBackImage,
                // onTap: () async {
                //   try {
                //     await viewModel.pickImage(sectionIdBack);
                //   } catch (e) {
                //     ScaffoldMessenger.of(context).showSnackBar(
                //       SnackBar(content: Text('Failed to pick an image: $e')),
                //     );
                //   }
                // },
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
