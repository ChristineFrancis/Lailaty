import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lailaty/core/resources/asset_manager.dart';
import 'package:lailaty/core/utils/build_context_extensions.dart';

class CaptainImage extends StatelessWidget {
  const CaptainImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: context.screenWidth * 0.06,
      backgroundColor: Colors.transparent,
      child: ClipOval(
        child: SvgPicture.asset(
          ImageAssetManager.profileExample,
          width: context.screenWidth * 0.12,
          height: context.screenWidth * 0.12,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
