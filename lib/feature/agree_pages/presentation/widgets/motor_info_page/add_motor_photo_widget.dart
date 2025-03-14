import 'dart:io';

import 'package:flutter/material.dart';
import 'package:lailaty/core/utils/build_context_extensions.dart';
import 'package:lailaty/core/state_managments/image_picker_cubit/image_pick_cubit.dart';
import '../../../../../core/resources/key_manager.dart';
import '../../../../../core/state_managments/personal_information_view.dart';
import '../personal_Information_page/image_picker_place_holder.dart';
import '../personal_Information_page/no_image_placeholder_widget.dart';

class addMotorPhotoWidget extends StatelessWidget {
  const addMotorPhotoWidget({
    super.key,
    required this.viewModel,
    required this.selectedPhoto,
  });

  final PersonalInformationCubit viewModel;
  final File? selectedPhoto;

  @override
  Widget build(BuildContext context) {
    return ImagePickerPlaceHolder(
      noImageWidget: const NoImagePlaceholderWidget(),
      width: context.screenWidth * 0.3,
      height: context.screenWidth * 0.3,
      imageKey: AppKeys.motorPhoto,
      onImageSelected: (key, image) {
        viewModel.updateImage(key, image);
      },
      // hasImage: selectedPhoto == null,
      // imageFile: selectedPhoto,
      // onTap: () async {
      //   try {
      //     await viewModel.pickImage(AppKeys.motorPhoto);
      //   } catch (e) {
      //     ScaffoldMessenger.of(context).showSnackBar(
      //       SnackBar(content: Text('Failed to pick an image: $e')),
      //     );
      //   }
      // },
    );
  }
}
