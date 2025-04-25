import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lailaty/core/config/presentation/widget/myButton.dart';
import 'package:lailaty/core/resources/color_manager.dart';
import 'package:lailaty/core/resources/key_manager.dart';
import 'package:lailaty/core/resources/string_manager.dart';
import 'package:lailaty/core/resources/style_maneger.dart';
import 'package:lailaty/core/utils/build_context_extensions.dart';
import 'package:lailaty/feature/old_splash/widgets/custom_text_widget.dart';
import 'package:lailaty/feature/authentication/presentation/ui/widgets/dialogs/ledy_captian_dialog.dart';

class CaptainGenderDialog extends StatelessWidget {
  final bool captainForAFleetOwner;
  const CaptainGenderDialog({
    super.key,
    this.captainForAFleetOwner = false,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: ColorManager.backGroundColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      insetPadding: EdgeInsets.all(context.screenWidth * 0.03),
      title: Container(
        width: context.screenWidth * 0.85,
        //  height: context.screenHeight * 0.05,
        //  padding: EdgeInsets.all(context.screenWidth * 0.02),
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 1),
          borderRadius: BorderRadius.circular(8),
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
        height: context.screenHeight * 0.25,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: context.screenHeight * 0.02),
            CustomTextWidget(
              text: StringManager.areYou,
              fontSize: context.screenWidth * 0.06,
              color: ColorManager.black,
            ),
            SizedBox(height: context.screenHeight * 0.03),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: _buildButton(
                    context,
                    title: StringManager.ladyCaptian,
                    onPress: () {
                      context.pop();
                      // Navigator.pop(context);
                      showDialog(
                        context: context,
                        builder: (context) => LedyCaptianDialog(
                          captainForAFleetOwner: captainForAFleetOwner,
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(width: context.screenWidth * 0.05),
                Expanded(
                  child: _buildButton(
                    context,
                    title: StringManager.captian,
                    onPress: () {
                      // context.push(captainForAFleetOwner
                      //     ? AppKeys.fleetToJoinPage
                      //     : AppKeys.personalInformationPageKey);
                      context.push(AppKeys.informationRegisterPageKey);
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(BuildContext context,
      {required String title, required VoidCallback onPress}) {
    return SizedBox(
      height: context.screenHeight * 0.06, // 6% of screen height
      child: MyButton(
        title: title,
        onpress: onPress,
        colors: ColorManager.grey1,
        width: double.infinity,
        height: double.infinity,
        radius: 5,
        styleOfTExt: StyleManager.semiboldTextStyle20(
          size: context.screenWidth * 0.045, // Responsive font size
        ),
      ),
    );
  }
}
