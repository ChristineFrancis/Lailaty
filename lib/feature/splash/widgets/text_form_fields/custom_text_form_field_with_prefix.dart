// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:lailaty/core/resources/color_manager.dart';
import 'package:lailaty/feature/out/widgets/custom_text_widget.dart';

class CustomTextFormFieldWithPrefix extends StatelessWidget {
  final TextEditingController controller;
  final String prefixText;
  final String hintText;
  final bool readOnly;

  const CustomTextFormFieldWithPrefix({
    super.key,
    required this.controller,
    required this.prefixText,
    required this.hintText,
    required this.readOnly,
  });

  double getResponsiveText(double fontSize, BuildContext context) {
    double scalefactor = getScalefactor(context);
    double responsiveFontSize = fontSize * scalefactor;
    double lowerLimit = fontSize * .8;
    double upperLimit = fontSize * 1.2;
    return responsiveFontSize.clamp(lowerLimit, upperLimit);
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double fieldWidth = screenWidth * 345 / 430;
    double fieldheight = screenHeight * 56 / 932;

    return SizedBox(
      width: fieldWidth,
      height: fieldheight,
      child: TextFormField(
        readOnly: readOnly,
        controller: controller,
        keyboardType: TextInputType.phone,
        textAlign: TextAlign.start,
        style: TextStyle(
          height: screenHeight * 1 / 932,
          fontSize: getResponsiveText(16, context),
        ),
        decoration: InputDecoration(
          //! prifex

          prefixIcon: SizedBox(
            width: screenWidth * 70 / 430,
            child: Row(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  child: CustomTextWidget(
                    text: prefixText,
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 7),
                  child: Container(
                    width: 1,
                    color: ColorManager.grey1,
                  ),
                ),
              ],
            ),
          ),
          //! end pre

          contentPadding: const EdgeInsets.symmetric(vertical: 15),
          filled: true,
          fillColor: Colors.white,
          //!hnt
          hintText: hintText,
          hintStyle: TextStyle(
            height: screenHeight * 4 / 9320,
            fontSize: getResponsiveText(16, context),
            color: Colors.grey,
          ),
          //!end hnt

          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.black, width: 3),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.black, width: 2),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.black, width: 2),
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'هذا الحقل مطلوب';
          }
          return null;
        },
      ),
    );
  }
}
