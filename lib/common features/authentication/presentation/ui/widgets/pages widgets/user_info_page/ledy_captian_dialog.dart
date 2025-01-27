import 'package:flutter/material.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/widgets/custom%20widgets/custom%20spaces/spc_y.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/widgets/custom%20widgets/custom_elevation_button.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/widgets/custom%20widgets/text%20widgets/custom_text_widget.dart';
import 'package:lailaty/core/resources/color_manager.dart';

class LedyCaptianDialog extends StatelessWidget {
  const LedyCaptianDialog({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return AlertDialog(
      backgroundColor: ColorManager.grey200,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      insetPadding: EdgeInsets.all(12),
      title: Expanded(
        child: Container(
          width: screenWidth * 365 / 430,
          height: screenHeight * 46 / 932,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 1.0),
            borderRadius: BorderRadius.circular(1.0),
          ),
          child: CustomTextWidget(
              text: 'اهلا بك في ليدي كابتن في تطبيق ليلتي',
              fontSize: 18,
              color: Colors.black),
        ),
      ),
      content: SizedBox(
        width: double.maxFinite,
        height: screenHeight * 230 / 932,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SpcY(y: 25),
            CustomTextWidget(
                text: 'هل تودين الظهور', fontSize: 24, color: Colors.black),
            SpcY(y: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: screenWidth * 173 / 430,
                  height: screenHeight * 54 / 932,
                  child: CustomElevatedButton(
                      text: 'الإناث فقط',
                      onPressed: () {},
                      textColor: ColorManager.yellow,
                      buttonColor: ColorManager.grey,
                      fontSize: 20),
                ),
                SizedBox(
                  width: screenWidth * 173 / 430,
                  height: screenHeight * 54 / 932,
                  child: CustomElevatedButton(
                      text: 'كل العملاء',
                      onPressed: () {},
                      textColor: ColorManager.yellow,
                      buttonColor: ColorManager.grey,
                      fontSize: 20),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
