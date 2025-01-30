import 'package:flutter/material.dart';
import 'package:lailaty/core/resources/color_manager.dart';
import 'package:lailaty/core/resources/string_manager.dart';
import 'package:lailaty/core/utils/build_context_extensions.dart';

class NoImagePlaceholderWidget extends StatelessWidget {
  const NoImagePlaceholderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          StringManager.add,
          style: TextStyle(
            fontSize: context.screenWidth * 0.05,
            color: ColorManager.grey1,
          ),
        ),
        SizedBox(
          width: context.screenWidth * 0.01,
        ),
        Icon(
          Icons.photo_camera_back,
          size: context.screenWidth * 0.08,
          color: ColorManager.grey1,
        ),
      ],
    );
  }
}
