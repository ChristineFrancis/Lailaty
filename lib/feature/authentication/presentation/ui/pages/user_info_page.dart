import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lailaty/core/resources/asset_manager.dart';
import 'package:lailaty/core/resources/color_manager.dart';
import 'package:lailaty/core/utils/build_context_extensions.dart';
import 'package:lailaty/feature/authentication/presentation/ui/widgets/custom%20widgets/text%20widgets/custom_text_widget.dart';
import 'package:lailaty/feature/authentication/presentation/ui/widgets/custom_button.dart';
import 'package:lailaty/feature/authentication/presentation/ui/widgets/dialogs/ostol_owner_dialog.dart';
import 'package:lailaty/feature/authentication/presentation/ui/widgets/logo_with_laylaty.dart';

class UserInfoPage extends StatelessWidget {
  const UserInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Obtain screen dimensions from your extension (or MediaQuery)
    final double screenWidth = context.screenWidth;
    final double screenHeight = context.screenHeight;

    // Layout constants (using the final state that was used when _clickCount == 3)
    const double imgOpacity = 1.0;
    const double horizontalOffset = 0.25;
    const double verticalOffset = 0.12;
    const double scale = 0.35;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ColorManager.grey1,
      body: Stack(
        children: [
          // --- Background Image ---
          Positioned(
            // Move the image left by horizontalOffset*screenWidth and down by verticalOffset*screenHeight
            left: screenWidth * -horizontalOffset,
            top: screenHeight * verticalOffset,
            child: Transform.scale(
              scale: scale,
              child: SvgPicture.asset(
                ImageAssetManager.lailatyArabic,
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.white.withOpacity(imgOpacity),
                  BlendMode.modulate,
                ),
                width: screenWidth * 1.5,
              ),
            ),
          ),
          // --- Top Logo ---
          Positioned(
            left: screenWidth * 0.32,
            top: screenHeight * 0.13,
            child: const LogoWithLaylaty(),
          ),
          // --- Back Button ---
          Positioned(
            top: screenHeight * 0.016,
            right: screenWidth * 0.005,
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(
                Icons.arrow_back,
                color: ColorManager.yellowTextColor,
              ),
            ),
          ),
          // --- Main Content ---
          Positioned(
            top: screenHeight * 0.26,
            left: 0,
            right: 0,
            child: SizedBox(
              height: screenHeight / 1.5,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Title text "هل انت"
                  Positioned(
                    top: screenHeight * 0.1,
                    child:  CustomTextWidget(
                      text: "هل انت",
                      fontSize: 36,
                      color: Colors.black,
                    ),
                  ),
                  // Background car image (captain theme)
                  Positioned(
                    right: 0,
                    child: SvgPicture.asset(
                      ImageAssetManager.captainBackGroundCar,
                      width: screenWidth * 0.15,
                      height: screenHeight * 0.15,
                    ),
                  ),
                  // Passenger image
                  Positioned(
                    left: screenWidth * 0.1,
                    child: SvgPicture.asset(
                      ImageAssetManager.passengerPic,
                      width: screenWidth * 0.3,
                      height: screenHeight * 0.2,
                    ),
                  ),
                  // Captain image
                  Positioned(
                    right: screenWidth * 0.15,
                    child: SvgPicture.asset(
                      ImageAssetManager.captainPic,
                      width: screenWidth * 0.3,
                      height: screenHeight * 0.2,
                    ),
                  ),
                  // "كابتن" Button at the bottom, centered horizontally
                  Positioned(
                    bottom: screenHeight * 90 / 932,
                    left: (screenWidth - (screenWidth * 140 / 430)) / 2,
                    child: SizedBox(
                      width: screenWidth * 140 / 430,
                      height: screenHeight * 50 / 932,
                      child: CustomButton(
                        textButton: 'كابتن',
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) => const OstolOwnerDialog(),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
