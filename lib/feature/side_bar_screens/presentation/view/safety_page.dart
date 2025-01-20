import 'package:flutter/material.dart';
import 'package:lailaty/core/config/presentation/widget/custom_appbar.dart';
import 'package:lailaty/core/resources/color_manager.dart';
import 'package:lailaty/core/resources/string_manager.dart';
import 'package:lailaty/core/resources/style_maneger.dart';
import 'package:lailaty/core/utils/build_context_extensions.dart';

class SafetyPage extends StatelessWidget {
  const SafetyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.backGroundColor,
      appBar: CustomAppbar(
        ispop: true,
        title: StringManager.safety,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(
              height: context.screenHeight * 0.05,
            ),
            Center(
              child: Icon(
                Icons.verified_user_outlined,
                size: context.screenWidth * 0.5,
              ),
            ),
            SizedBox(
              height: context.screenHeight * 0.01,
            ),
            Center(
              child: Text(
                StringManager.whoToContact,
                style: StyleManager.boldTextStyle24(),
              ),
            ),
            SizedBox(
              height: context.screenHeight * 0.03,
            ),
            Padding(
              padding: EdgeInsets.only(right: context.screenWidth * 0.12),
              child: Text(
                StringManager.ambulance,
                style: StyleManager.boldTextStyle24(),
              ),
            ),
            Divider(
              color: ColorManager.grey1,
              thickness: 2,
              endIndent: context.screenWidth * 0.12,
              indent: context.screenWidth * 0.12,
            ),
            Padding(
              padding: EdgeInsets.only(right: context.screenWidth * 0.12),
              child: Text(
                StringManager.police,
                style: StyleManager.boldTextStyle24(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
