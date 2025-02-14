import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lailaty/core/resources/asset_manager.dart';
import 'package:lailaty/core/resources/color_manager.dart';
import 'package:lailaty/core/resources/string_manager.dart';
import 'package:lailaty/core/resources/style_maneger.dart';
import 'package:lailaty/core/utils/build_context_extensions.dart';

class WaitingForApprove extends StatelessWidget {
  const WaitingForApprove({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            StringManager.waitingForTheFleetOwnerToApproveYourApplication,
            textAlign: TextAlign.center,
            style: StyleManager.boldTextStyle24(
              color: ColorManager.black,
              size: context.screenWidth * 0.05,
            ),
          ),
          SizedBox(
            height: context.screenHeight * 0.02,
          ),
          SvgPicture.asset(
            ImageAssetManager.waitingPic,
            width: context.screenWidth * 0.5,
            height: context.screenWidth * 0.5,
          ),
        ],
      ),
    );
  }
}
