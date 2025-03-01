import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lailaty/core/config/presentation/widget/myButton.dart';
import 'package:lailaty/core/resources/color_manager.dart';
import 'package:lailaty/core/resources/key_manager.dart';
import 'package:lailaty/core/resources/string_manager.dart';
import 'package:lailaty/core/resources/style_maneger.dart';
import 'package:lailaty/core/utils/build_context_extensions.dart';
import 'package:lailaty/feature/splash/widgets/custom_text_widget.dart';

class LedyCaptianDialog extends StatelessWidget {
  final bool captainForAFleetOwner;
  const LedyCaptianDialog({
    super.key,
    this.captainForAFleetOwner = false,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: ColorManager.backGroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(context.screenWidth * 0.03),
      ),
      insetPadding: EdgeInsets.all(context.screenWidth * 0.03),
      title: Container(
        width: context.screenWidth * 0.85,
        height: context.screenHeight * 0.05,
        padding: EdgeInsets.all(context.screenWidth * 0.02),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 1),
          borderRadius: BorderRadius.circular(context.screenWidth * 0.02),
        ),
        alignment: Alignment.center,
        child: CustomTextWidget(
          text: StringManager.welcomeToLadyCaptainInLaylatyApp,
          fontSize: context.screenWidth * 0.045,
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
              text: StringManager.doYouWantToShowUp,
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
                    title: StringManager.femalesOnly,
                    onPress: () {
                      context.push(
                        captainForAFleetOwner
                            ? AppKeys.fleetToJoinPage
                            : AppKeys.personalInformationPageKey,
                      );
                    },
                  ),
                ),
                SizedBox(width: context.screenWidth * 0.05),
                Expanded(
                  child: _buildButton(
                    context,
                    title: StringManager.allCustomers,
                    onPress: () {
                      context.push(
                        captainForAFleetOwner
                            ? AppKeys.fleetToJoinPage
                            : AppKeys.personalInformationPageKey,
                      );
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

  Widget _buildButton(BuildContext context, {required String title, required VoidCallback onPress}) {
    return SizedBox(
      height: context.screenHeight * 0.06,
      child: MyButton(
        title: title,
        onpress: onPress,
        colors: ColorManager.grey1,
        width: double.infinity,
        height: double.infinity,
        radius: context.screenWidth * 0.02,
        styleOfTExt: StyleManager.semiboldTextStyle20(
          size: context.screenWidth * 0.045,
        ),
      ),
    );
  }
}
