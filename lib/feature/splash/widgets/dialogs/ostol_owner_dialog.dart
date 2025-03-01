import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lailaty/core/config/presentation/widget/myButton.dart';
import 'package:lailaty/core/resources/color_manager.dart';
import 'package:lailaty/core/resources/key_manager.dart';
import 'package:lailaty/core/resources/string_manager.dart';
import 'package:lailaty/core/resources/style_maneger.dart';
import 'package:lailaty/core/utils/build_context_extensions.dart';
import 'package:lailaty/feature/out/widgets/custom_text_widget.dart';
import 'package:lailaty/feature/out/widgets/dialogs/captain_gender_dialog.dart';

class OstolOwnerDialog extends StatelessWidget {
  const OstolOwnerDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: ColorManager.backGroundColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      insetPadding: EdgeInsets.all(12),
      title: Container(
        width: context.screenWidth * 0.85,
        height: context.screenHeight * 0.05,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 1.0),
          borderRadius: BorderRadius.circular(5.0),
        ),
        alignment: Alignment.center,
        child: CustomTextWidget(
          text: StringManager.welcomeToLaylatyApp,
          fontSize: context.screenWidth * 0.04,
          color: ColorManager.black,
        ),
      ),
      content: SizedBox(
        width: double.maxFinite,
        height: context.screenHeight * 0.3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: context.screenHeight * 0.015),
            CustomTextWidget(
              text: StringManager.areYou,
              fontSize: context.screenWidth * 0.055,
              color: ColorManager.black,
            ),
            SizedBox(height: context.screenHeight * 0.03),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: _buildButton(
                    context,
                    title: StringManager.fleetOwner,
                    onPress: () => context.push(AppKeys.fleetInformationPage),
                  ),
                ),
                SizedBox(width: context.screenWidth * 0.04),
                Expanded(
                  child: _buildButton(
                    context,
                    title: StringManager.carCaptain,
                    onPress: () {
                      Navigator.pop(context);
                      showDialog(
                          context: context,
                          builder: (context) => CaptainGenderDialog());
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: context.screenHeight * 0.02),
            _buildButton(
              context,
              title: StringManager.captainForAFleetOwner,
              onPress: () {
                Navigator.pop(context);
                showDialog(
                    context: context,
                    builder: (context) => const CaptainGenderDialog(
                          captainForAFleetOwner: true,
                        ));
                //must add boolean in order to make it go to the fleet info
              },
              fullWidth: true,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(BuildContext context,
      {required String title,
      required VoidCallback onPress,
      bool fullWidth = false}) {
    return SizedBox(
      width: fullWidth ? context.screenWidth * 0.7 : context.screenWidth * 0.4,
      height: context.screenHeight * 0.06,
      child: MyButton(
        title: title,
        onpress: onPress,
        colors: ColorManager.grey1,
        width:
            fullWidth ? context.screenWidth * 0.7 : context.screenWidth * 0.4,
        height: context.screenHeight * 0.06,
        radius: 5,
        styleOfTExt: StyleManager.semiboldTextStyle20(
          size: context.screenHeight * 0.02,
        ),
      ),
    );
  }
}
