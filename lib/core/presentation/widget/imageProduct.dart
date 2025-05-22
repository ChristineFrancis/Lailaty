import 'package:flutter/material.dart';

import '../../resources/asset_manager.dart';
import '../../resources/color_manager.dart';

class ImageProduct extends StatelessWidget {
  String image;
  ImageProduct({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: MediaQuery.of(context).size.width / 12,
      backgroundImage: AssetImage(ImageAssetManager.noPhoto),
      onBackgroundImageError: (exception, stackTrace) {
        debugPrint('Error loading image: $exception');
      },
      child: ClipOval(
        child: Image.network(
          image,
          fit: BoxFit.contain,
          errorBuilder: (context, error, stackTrace) =>
              Image.asset(ImageAssetManager.noPhoto),
        ),
      ),
    );
  }
}
