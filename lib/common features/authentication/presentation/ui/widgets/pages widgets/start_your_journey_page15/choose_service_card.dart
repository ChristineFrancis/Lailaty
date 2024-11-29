import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/widgets/custom%20widgets/text%20widgets/custom_text_widget.dart';

class ChooseServiceCard extends StatelessWidget {
  final String svgPictureName;
  final Color containerColor;
  final String firstText;
  final Color firstTextColor;
  final String secondText;
  final void Function()? onTap;
  final double screenHeight;
  final double screenWidth;

  const ChooseServiceCard({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
    required this.svgPictureName,
    required this.containerColor,
    required this.firstText,
    required this.firstTextColor,
    required this.secondText,
    required this.onTap,
  });

  Color darken(Color color, [double amount = .05]) {
    //!the amount we darken the color in the corners
    assert(amount >= 0 && amount <= 1);

    final hsl = HSLColor.fromColor(color);
    final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));

    return hslDark.toColor();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(12),
        elevation: 5,
        shadowColor: Colors.grey.withOpacity(0.4),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                // const Color(0xCC000000),
                // const Color(0x00000000),
                containerColor,
                darken(containerColor),
              ],
              //stops: [0.0, 0.6, 1.0],
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          padding: EdgeInsets.symmetric(
            vertical: screenHeight * 0.008,
            horizontal: screenWidth * 0.005,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: screenHeight * screenWidth * 0.00015,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: screenHeight * screenWidth * 0.00007,
                      width: screenWidth * screenHeight * 0.0002,
                      child: SvgPicture.asset(svgPictureName),
                    ),
                    SizedBox(
                      //height: screenHeight * 0.03,
                      child: CustomTextWidget(
                        text: firstText,
                        fontSize: 22,
                        color: firstTextColor,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: screenHeight * screenWidth * 0.00032,
                child: Center(
                  child: CustomTextWidget(
                    text: secondText,
                    fontSize: 13,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
