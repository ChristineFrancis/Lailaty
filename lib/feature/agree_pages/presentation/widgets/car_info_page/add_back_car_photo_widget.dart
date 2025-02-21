import 'dart:io';

import 'package:flutter/material.dart';
import 'package:lailaty/core/utils/build_context_extensions.dart';
import '../../../../../core/resources/key_manager.dart';
import '../../../../../core/viewmodels/personal_information_view.dart';
import '../personal_Information_page/image_picker_place_holder.dart';
import '../personal_Information_page/no_image_placeholder_widget.dart';

class addBackCarPhotoWidget extends StatelessWidget {
  const addBackCarPhotoWidget({
    super.key,
    required this.viewModel,
    required this.selectedPhoto,
  });

  final PersonalInformationView viewModel;
  final File? selectedPhoto;

  @override
  Widget build(BuildContext context) {
    return ImagePickerPlaceHolder(
      noImgeWidget: const NoImagePlaceholderWidget(),
      width: context.screenWidth * 0.3,
      height: context.screenWidth * 0.3,
      //   width: MediaQuery.of(context).size.width * 0.26,
      //  height: MediaQuery.of(context).size.height * 0.17,
      hasImage: selectedPhoto == null,
      imageFile: selectedPhoto,
      onTap: () async {
        try {
          await viewModel.pickImage(AppKeys.carBack);
        } catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Failed to pick an image: $e')),
          );
        }
      },
    );
  }
}
