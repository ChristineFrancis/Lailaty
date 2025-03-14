import 'dart:io';

import 'package:flutter/material.dart';
import 'package:lailaty/core/utils/build_context_extensions.dart';
import 'package:lailaty/core/state_managments/image_picker_cubit/image_pick_cubit.dart';
import '../../../../../core/resources/key_manager.dart';
import '../../../../../core/state_managments/personal_information_view.dart';
import '../personal_Information_page/image_picker_place_holder.dart';
import '../personal_Information_page/no_image_placeholder_widget.dart';

class addLecienceMotorPhotoWidget extends StatelessWidget {
  const addLecienceMotorPhotoWidget({
    super.key,
    required this.viewModel,
    required this.selectedFrontPhoto,
    required this.selectedBackPhoto,
  });

  final PersonalInformationCubit viewModel;
  final File? selectedFrontPhoto;
  final File? selectedBackPhoto;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ImagePickerPlaceHolder(
            noImageWidget: const NoImagePlaceholderWidget(),
            width: context.screenWidth * 0.3,
            height: context.screenWidth * 0.3,
            imageKey: AppKeys.frontMotorLicence,
            onImageSelected: (key, image) {
              viewModel.updateImage(key, image);
            },
            // hasImage: selectedFrontPhoto == null,
            // imageFile: selectedFrontPhoto,
            // onTap: () async {
            //   try {
            //     await viewModel.pickImage(AppKeys.frontMotorLicence);
            //   } catch (e) {
            //     ScaffoldMessenger.of(context).showSnackBar(
            //       SnackBar(content: Text('Failed to pick an image: $e')),
            //     );
            //   }
            // },
          ),
          const SizedBox(
            width: 3,
          ),
          ImagePickerPlaceHolder(
            noImageWidget: const NoImagePlaceholderWidget(),
            width: context.screenWidth * 0.3,
            height: context.screenWidth * 0.3,
            imageKey: AppKeys.backMotorLicence,
            onImageSelected: (key, image) {
              viewModel.updateImage(key, image);
            },
            // hasImage: selectedBackPhoto == null,
            // imageFile: selectedBackPhoto,
            // onTap: () async {
            //   try {
            //     await viewModel.pickImage(AppKeys.backMotorLicence);
            //   } catch (e) {
            //     ScaffoldMessenger.of(context).showSnackBar(
            //       SnackBar(content: Text('Failed to pick an image: $e')),
            //     );
            //   }
            // },
          ),
        ],
      ),
    );
  }
}
