import 'package:flutter/material.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/widgets/custom%20widgets/custom%20spaces/spc_y.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/widgets/custom%20widgets/custom_elevation_button.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/widgets/custom%20widgets/text%20widgets/custom_text_widget.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/widgets/pages%20widgets/user_info_page/captain_dialogs/captain_gender_dialog.dart';
import 'package:lailaty/core/resources/color_manager.dart';

class OstolOwnerDialog extends StatelessWidget {
  const OstolOwnerDialog({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return AlertDialog(
      backgroundColor: ColorManager.grey200,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      insetPadding: EdgeInsets.all(12),
      title: Container(
        width: screenWidth * 365 / 430,
        height: screenHeight * 46 / 932,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 1.0),
          borderRadius: BorderRadius.circular(1.0),
        ),
        child: CustomTextWidget(
          text: 'اهلا بك في تطبيق ليلتي',
          fontSize: 18,
          color: Colors.black,
        ),
      ),
      content: SizedBox(
        width: double.maxFinite,
        height: screenHeight * 230 / 932,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SpcY(y: 10),
            CustomTextWidget(
              text: 'هل انت؟',
              fontSize: 24,
              color: Colors.black,
            ),
            SpcY(y: 35),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: screenWidth * 160 / 430,
                  height: screenHeight * 54 / 932,
                  child: CustomElevatedButton(
                    text: 'مالك أسطول',
                    onPressed: () {
                      Navigator.pop(context);
                      showDialog(
                          context: context,
                          builder: (context) => CaptainGenderDialog());
                    },
                    textColor: ColorManager.yellow,
                    buttonColor: ColorManager.grey,
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  width: screenWidth * 160 / 430,
                  height: screenHeight * 54 / 932,
                  child: CustomElevatedButton(
                    text: 'كابتن سيارة',
                    onPressed: () {
                      Navigator.pop(context);
                      showDialog(
                          context: context,
                          builder: (context) => CaptainGenderDialog());
                    },
                    textColor: ColorManager.yellow,
                    buttonColor: ColorManager.grey,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            SpcY(y: 15),
            SizedBox(
              width: screenWidth * 245 / 430,
              height: screenHeight * 54 / 932,
              child: CustomElevatedButton(
                text: 'كابتن لدى مالك أسطول',
                onPressed: () {
                  Navigator.pop(context);
                  showDialog(
                      context: context,
                      builder: (context) => CaptainGenderDialog());
                },
                textColor: ColorManager.yellow,
                buttonColor: ColorManager.grey,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
