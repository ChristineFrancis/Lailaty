import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lailaty/core/resources/color_manager.dart';
import 'package:lailaty/core/resources/key_manager.dart';
import 'package:lailaty/core/resources/string_manager.dart';
import 'package:lailaty/core/resources/style_maneger.dart';
import 'package:lailaty/core/utils/build_context_extensions.dart';
import 'package:lailaty/feature/travel/presentation/widgets/travel_page/drawer_option.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: ColorManager.grey1,
      child: SafeArea(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            InkWell(
              onTap: () {
                context.push(AppKeys.profilePageKey);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  //  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.arrow_back_ios,
                      color: ColorManager.backGroundColor,
                    ),
                    const Spacer(),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          StringManager.exampleCaptainName,
                          style: StyleManager.boldTextStyle24(
                            size: context.screenWidth * 0.06,
                            color: ColorManager.black,
                          ),
                        ),
                        //! make function depend on the back the star will filled
                        Row(
                          children: [
                            Icon(
                              Icons.star_border,
                              color: ColorManager.yellowAccent,
                              size: context.screenWidth * 0.04,
                            ),
                            Icon(
                              Icons.star_border,
                              color: ColorManager.yellowAccent,
                              size: context.screenWidth * 0.04,
                            ),
                            Icon(
                              Icons.star_border,
                              color: ColorManager.yellowAccent,
                              size: context.screenWidth * 0.04,
                            ),
                            Icon(
                              Icons.star_border,
                              color: ColorManager.yellowAccent,
                              size: context.screenWidth * 0.04,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      width: context.screenWidth * 0.1,
                      height: context.screenWidth * 0.1,
                      decoration: BoxDecoration(
                        color: ColorManager.yellowAccent,
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Divider(
              color: ColorManager.black,
              endIndent: context.screenWidth * 0.04,
              indent: context.screenWidth * 0.04,
            ),
            DrawerOption(
              icon: Icons.verified_user_outlined,
              text: StringManager.safety,
              onTap: () {
                context.push(AppKeys.safetyPageKey);
              },
            ),
            SizedBox(
              height: context.screenHeight * 0.02,
            ),
            DrawerOption(
              icon: Icons.settings_outlined,
              text: StringManager.settings,
              onTap: () {
                context.push(AppKeys.settingsPageKey);
              },
            ),
            SizedBox(
              height: context.screenHeight * 0.02,
            ),
            DrawerOption(
              icon: Icons.share_outlined,
              text: StringManager.shareApp,
              onTap: () {
                context.push(AppKeys.shareAppPageKey);
              },
            ),
            SizedBox(
              height: context.screenHeight * 0.02,
            ),
            DrawerOption(
              icon: Icons.support_agent,
              text: StringManager.callUs,
              onTap: () {
                context.push(AppKeys.callUsPageKey);
              },
            ),
          ],
        ),
      ),
    );
  }
}
