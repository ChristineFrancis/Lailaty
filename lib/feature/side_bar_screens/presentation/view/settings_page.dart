import 'package:flutter/material.dart';
import 'package:lailaty/core/config/presentation/widget/custom_appbar.dart';
import 'package:lailaty/core/resources/color_manager.dart';
import 'package:lailaty/core/resources/string_manager.dart';
import 'package:lailaty/core/resources/style_maneger.dart';
import 'package:lailaty/core/utils/build_context_extensions.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.backGroundColor,
      appBar: CustomAppbar(
        ispop: true,
        title: StringManager.settings,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.only(right: context.screenWidth * 0.05),
                child: Text(
                  StringManager.appLanguage,
                  style: StyleManager.boldTextStyle24(
                    size: context.screenWidth * 0.075,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: context.screenWidth * 0.08),
                child: Text(
                  StringManager.arabic,
                  style: StyleManager.semiboldTextStyle20(
                    size: context.screenWidth * 0.05,
                  ),
                ),
              ),
              const CustomDivider(),
              Padding(
                padding: EdgeInsets.only(right: context.screenWidth * 0.05),
                child: Text(
                  StringManager.rateApp,
                  style: StyleManager.boldTextStyle24(
                    size: context.screenWidth * 0.075,
                  ),
                ),
              ),
              SizedBox(
                height: context.screenHeight * 0.02,
              ),
              const CustomDivider(),
              Padding(
                padding: EdgeInsets.only(right: context.screenWidth * 0.05),
                child: Text(
                  StringManager.appVersion,
                  style: StyleManager.boldTextStyle24(
                    size: context.screenWidth * 0.075,
                  ),
                ),
              ),
              //! add the app virsion:
              SizedBox(
                height: context.screenHeight * 0.02,
              ),
              const CustomDivider(),
              Padding(
                padding: EdgeInsets.only(right: context.screenWidth * 0.05),
                child: Text(
                  StringManager.logOut,
                  style: StyleManager.boldTextStyle24(
                    size: context.screenWidth * 0.075,
                  ),
                ),
              ),
              SizedBox(
                height: context.screenHeight * 0.02,
              ),
              const CustomDivider(),
              Padding(
                padding: EdgeInsets.only(right: context.screenWidth * 0.05),
                child: Text(
                  StringManager.deleteAccount,
                  style: StyleManager.boldTextStyle24(
                    size: context.screenWidth * 0.075,
                    color: ColorManager.errorColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: ColorManager.grey1,
      thickness: 2,
      endIndent: context.screenWidth * 0.08,
      indent: context.screenWidth * 0.08,
    );
  }
}
