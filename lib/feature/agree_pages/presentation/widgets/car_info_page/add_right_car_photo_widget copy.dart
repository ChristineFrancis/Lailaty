import 'dart:io';

import 'package:flutter/material.dart';
import 'package:lailaty/core/utils/build_context_extensions.dart';
import 'package:lailaty/core/viewmodels/image_picker_cubit/image_pick_cubit.dart';
import '../../../../../core/resources/key_manager.dart';
import '../../../../../core/viewmodels/personal_information_view.dart';
import '../personal_Information_page/image_picker_place_holder.dart';
import '../personal_Information_page/no_image_placeholder_widget.dart';

class addRightCarPhotoWidget extends StatelessWidget {
  const addRightCarPhotoWidget({
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
      // width: MediaQuery.of(context).size.width * 0.26,
      // height: MediaQuery.of(context).size.height * 0.17,
      onImageSelected: (key, image) {
        viewModel.updateImage(key, image);
      },
      imageKey: AppKeys.carRight,
      // hasImage: selectedPhoto == null,
      // imageFile: selectedPhoto,
      // onTap: () async {
      //   try {
      //     await viewModel.pickImage(AppKeys.carRight);
      //   } catch (e) {
      //     ScaffoldMessenger.of(context).showSnackBar(
      //       SnackBar(content: Text('Failed to pick an image: $e')),
      //     );
      //   }
      // },
    );
  }
}
