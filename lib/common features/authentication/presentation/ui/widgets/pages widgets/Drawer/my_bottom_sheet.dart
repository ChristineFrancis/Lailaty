import 'package:flutter/material.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/widgets/custom%20widgets/custom_elevation_button.dart';
import 'package:lailaty/core/resources/color_manager.dart';

class MyBottomSheet extends StatelessWidget {
  const MyBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      width: screenWidth * 0.93,
      height: screenHeight * 0.27,
      decoration: BoxDecoration(
        color: ColorManager.grey, // Background color of the bottom sheet
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min, // Adjust height to fit content
        children: [
          SizedBox(height: 7),
          Container(
            height: 4,
            width: screenWidth * 0.18,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(7),
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.symmetric(horizontal: 8),
            height: screenHeight * 0.05,
            child: InkWell(
              onTap: () => Navigator.pop(context),
              child: Container(
                alignment: Alignment.center,
                width: 35,
                height: 35,
                padding: EdgeInsets.all(0),
                decoration: BoxDecoration(
                    color: ColorManager.yellow,
                    borderRadius: BorderRadius.circular(20)),
                child: Icon(
                  Icons.close,
                  color: ColorManager.grey,
                  size: 30,
                ),
              ),
            ),
          ),
          SizedBox(
            height: screenHeight * 0.057,
            child: CustomElevatedButton(
                text: 'لدي حساب بالفعل',
                onPressed: () {},
                textColor: Colors.black,
                buttonColor: ColorManager.yellow,
                fontSize: 23),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: screenHeight * 0.057,
            child: CustomElevatedButton(
                text: 'التحقق لإكمال التسجيل',
                onPressed: () {},
                textColor: Colors.black,
                buttonColor: ColorManager.yellow,
                fontSize: 23),
          ),
          SizedBox(height: screenHeight * 0.04),
        ],
      ),
    );
  }
}
