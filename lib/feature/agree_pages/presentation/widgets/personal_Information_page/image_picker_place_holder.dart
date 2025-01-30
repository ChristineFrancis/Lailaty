import 'dart:io';
import 'package:flutter/material.dart';
import 'package:lailaty/core/resources/color_manager.dart';

class ImagePickerPlaceHolder extends StatelessWidget {
  final bool hasImage;
  final File? imageFile;
  final VoidCallback onTap;
  final double width;
  final double height;
  final Widget noImgeWidget;
  const ImagePickerPlaceHolder(
      {super.key,
      required this.hasImage,
      this.imageFile,
      required this.onTap,
      required this.width,
      required this.height,
      required this.noImgeWidget});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          border: Border.all(
            color: ColorManager.grey1,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(20),
          color: ColorManager.whiteColor,
        ),
        child: hasImage
            ? noImgeWidget
            : ClipRRect(
                borderRadius: BorderRadius.circular(17),
                child: Image.file(
                  imageFile!,
                  fit: BoxFit.fill,
                  width: double.infinity,
                  height: double.infinity,
                ),
              ),
      ),
    );
  }
}
