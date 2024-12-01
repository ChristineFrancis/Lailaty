import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/widgets/custom%20widgets/text%20widgets/custom_text_widget.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/widgets/pages%20widgets/start_your_journey_page15/small_elevated_button.dart';
import 'package:lailaty/core/resources/color_manager.dart';

class ChooseCarCard extends StatelessWidget {
  final String svgPictureName;
  final String title;
  final String description;
  final String price;
  final VoidCallback onpressed;

  const ChooseCarCard(
      {super.key,
      required this.svgPictureName,
      required this.title,
      required this.description,
      required this.price,
      required this.onpressed});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(12),
      elevation: 5,
      shadowColor: Colors.grey.withOpacity(0.4),
      child: Container(
        decoration: BoxDecoration(
          color: ColorManager.grey,
          borderRadius: BorderRadius.circular(12),
        ),
        padding: EdgeInsets.symmetric(
          vertical: screenHeight * 0.008,
          horizontal: screenWidth * 0.01,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: screenHeight * 0.04,
              width: screenWidth * 0.172,
              child: SvgPicture.asset(svgPictureName),
            ),
            CustomTextWidget(
                text: title, fontSize: 11, color: ColorManager.yellow),
            CustomTextWidget(
                text: description, fontSize: 9, color: Colors.black),
            CustomTextWidget(
                text: price, fontSize: 20, color: ColorManager.yellow),
            SizedBox(
              height: screenHeight * 0.042,
              width: screenWidth * 0.16,
              child: SmallElevatedButton(
                text: 'اختر سيارتك',
                onPressed: onpressed,
                textColor: ColorManager.grey,
                buttonColor: ColorManager.yellow,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
