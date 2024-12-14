import 'package:flutter/material.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/widgets/custom%20widgets/text%20widgets/custom_text_widget.dart';

class CustomTextFormFieldSuffix extends StatelessWidget {
  final String hintText;
  final Color hintTextColor;
  final bool isArabic;
  final TextAlign textAlign;
  final double fontSizeText;
  final double? heightTextFormField;
  final bool isReadonly;
  final Widget suffixIcon;

  CustomTextFormFieldSuffix({
    super.key,
    required this.hintText,
    required this.hintTextColor,
    this.isArabic = false,
    this.textAlign = TextAlign.end,
    required this.fontSizeText,
    this.heightTextFormField,
    this.isReadonly = false,
    required this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double fieldWidth = screenWidth * 0.8;
    double fieldHeight = screenHeight * 0.05;

    return SizedBox(
      width: fieldWidth,
      height: heightTextFormField ?? fieldHeight,
      child: AbsorbPointer( // Prevents TextFormField from intercepting taps
        absorbing: isReadonly,
        child: TextFormField(
          readOnly: isReadonly,
          textDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
          textAlign: textAlign,
          style: TextStyle(
            height: 1.2,
            fontSize: getResponsiveText(fontSizeText, context),
          ),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 1.2),
            filled: true,
            fillColor: Colors.white,
            hintText: hintText,
            suffixIcon: suffixIcon,
            hintStyle: TextStyle(
              height: 1.2,
              fontSize: getResponsiveText(fontSizeText, context),
              color: hintTextColor,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.black, width: 4),
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
      ),
    );
  }
}
