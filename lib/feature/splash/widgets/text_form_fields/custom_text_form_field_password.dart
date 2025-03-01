import 'package:flutter/material.dart';
import 'package:lailaty/feature/splash/widgets/custom_text_widget.dart';

class CustomTextFormFieldPassword extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool readOnly;
  final double fontSize;

  const CustomTextFormFieldPassword(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.readOnly,
      required this.fontSize});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double fieldWidth = screenWidth * 345 / 430;
    double fieldheight = screenHeight * 56 / 932;
    double getResponsiveText(double fontSize, BuildContext context) {
      double scalefactor = getScalefactor(context);
      double responsiveFontSize = fontSize * scalefactor;
      double lowerLimit = fontSize * .8;
      double upperLimit = fontSize * 1.2;
      return responsiveFontSize.clamp(lowerLimit, upperLimit);
    }

    return SizedBox(
      width: fieldWidth,
      height: fieldheight,
      child: TextFormField(
        readOnly: readOnly,
        obscureText: true,
        controller: controller,
        keyboardType: TextInputType.visiblePassword,
        textAlign: TextAlign.center,
        style: TextStyle(
            height: screenHeight * 0.001,
            fontSize: getResponsiveText(fontSize, context)),
        decoration: InputDecoration(
          /*contentPadding: const EdgeInsets.symmetric(
                      vertical: 5), // Make the field thinner*/
          filled: true,
          fillColor: Colors.white,
          hintText: hintText,
          hintStyle: TextStyle(
              fontSize: getResponsiveText(fontSize, context),
              color: Colors.grey), // Hint covers entire field
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
                color: Colors.black, width: 4), // Thicker border
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.black, width: 2),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.black, width: 2),
          ),
        ),
      ),
    );
  }
}
