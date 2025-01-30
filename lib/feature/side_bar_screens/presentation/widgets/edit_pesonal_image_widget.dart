import 'dart:io';
import 'package:flutter/material.dart';
import 'package:lailaty/core/resources/color_manager.dart';
import 'package:lailaty/core/resources/key_manager.dart';
import 'package:lailaty/core/resources/string_manager.dart';
import 'package:lailaty/core/resources/style_maneger.dart';
import 'package:lailaty/core/utils/build_context_extensions.dart';
import 'package:lailaty/core/viewmodels/personal_information_view.dart';

class EditPesonalImageWidget extends StatelessWidget {
  const EditPesonalImageWidget({
    super.key,
    required this.personalImageViewModel,
    required this.selectedImage,
  });

  final PersonalInformationView personalImageViewModel;
  final File? selectedImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      width: context.screenWidth,
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            StringManager.personalImage2,
            style: StyleManager.boldTextStyle24(
              size: context.screenWidth * 0.05,
            ),
          ),
          SizedBox(
            width: context.screenWidth * 0.02,
          ),
          GestureDetector(
            onTap: () async {
              try {
                await personalImageViewModel
                    .pickImage(AppKeys.personalPhotoEdit);
              } catch (e) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Failed to pick an image: $e'),
                  ),
                );
              }
            },
            child: selectedImage == null
                ? Icon(
                    Icons.image_outlined,
                    size: context.screenWidth * 0.3,
                  )
                : SizedBox(
                    width: context.screenWidth * 0.3,
                    height: context.screenWidth * 0.3,
                    child: Image.file(
                      selectedImage!,
                      fit: BoxFit.fill,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
