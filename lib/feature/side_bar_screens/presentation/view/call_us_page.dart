import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lailaty/core/config/widget/custom_appbar.dart';
import 'package:lailaty/core/resources/asset_manager.dart';
import 'package:lailaty/core/resources/color_manager.dart';
import 'package:lailaty/core/resources/string_manager.dart';
import 'package:lailaty/core/resources/style_maneger.dart';
import 'package:lailaty/core/utils/build_context_extensions.dart';

class CallUsPage extends StatelessWidget {
  const CallUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.backGroundColor,
      appBar: CustomAppbar(
        ispop: true,
        title: StringManager.callUs,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: context.screenHeight * 0.1,
              ),
              Text(
                StringManager.aboutLailatyMessage,
                textAlign: TextAlign.center,
                style: StyleManager.semiboldTextStyle20(
                  size: context.screenWidth * 0.045,
                ),
              ),
              SizedBox(
                height: context.screenHeight * 0.2,
              ),
              Text(
                StringManager.contactUs24,
                style: StyleManager.boldTextStyle24(
                  size: context.screenWidth * 0.05,
                ),
              ),
              SizedBox(
                height: context.screenHeight * 0.05,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SvgPicture.asset(
                    ImageAssetManager.facebookPic,
                    width: context.screenWidth * 0.1,
                    height: context.screenWidth * 0.1,
                  ),
                  SvgPicture.asset(
                    ImageAssetManager.whatsupPic,
                    width: context.screenWidth * 0.1,
                    height: context.screenWidth * 0.1,
                  ),
                  Icon(
                    Icons.phone_outlined,
                    color: ColorManager.grey2,
                    size: context.screenWidth * 0.1,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
