import 'dart:io';

import 'package:flutter/material.dart';
import 'package:lailaty/core/utils/build_context_extensions.dart';
import '../../../../../core/resources/key_manager.dart';
import '../../../../../core/viewmodels/personal_information_view.dart';
import '../personal_Information_page/image_picker_place_holder.dart';
import '../personal_Information_page/no_image_placeholder_widget.dart';

class addLeciencePhotoWidget extends StatelessWidget {
  const addLeciencePhotoWidget({
    super.key,
    required this.viewModel,
    required this.selectedFrontPhoto,
    required this.selectedBackPhoto,
  });

  final PersonalInformationView viewModel;
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
            noImgeWidget: const NoImagePlaceholderWidget(),
            width: context.screenWidth * 0.3,
            height: context.screenWidth * 0.3,
            // width: MediaQuery.of(context).size.width * 0.26,
            // height: MediaQuery.of(context).size.height * 0.17,
            hasImage: selectedFrontPhoto == null,
            imageFile: selectedFrontPhoto,
            onTap: () async {
              try {
                await viewModel.pickImage(AppKeys.frontLecienceCar);
              } catch (e) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Failed to pick an image: $e')),
                );
              }
            },
          ),
          const SizedBox(
            width: 3,
          ),
          ImagePickerPlaceHolder(
            noImgeWidget: const NoImagePlaceholderWidget(),
            // width: MediaQuery.of(context).size.width * 0.26,
            // height: MediaQuery.of(context).size.height * 0.17,
            width: context.screenWidth * 0.3,
            height: context.screenWidth * 0.3,
            hasImage: selectedBackPhoto == null,
            imageFile: selectedBackPhoto,
            onTap: () async {
              try {
                await viewModel.pickImage(AppKeys.backLecienceCar);
              } catch (e) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Failed to pick an image: $e')),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
