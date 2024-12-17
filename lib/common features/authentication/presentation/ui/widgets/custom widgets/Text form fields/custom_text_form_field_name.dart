import 'package:flutter/material.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/widgets/custom%20widgets/text%20widgets/custom_text_widget.dart';
import 'package:lailaty/core/resources/color_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormFieldName extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  Color? hintTextColor;
  final bool isArabic;
  TextAlign textAlign;
  double? fontSizeText;
  double? heightTextFormField;
  final bool isNum;
  final int maxLines;
  final bool isReadonly;

  CustomTextFormFieldName({
    super.key,
    required this.controller,
    required this.hintText,
    this.hintTextColor,
    this.isArabic = false,
    this.textAlign = TextAlign.end,
    this.fontSizeText,
    this.heightTextFormField,
    this.isNum = false,
    this.maxLines = 1,
    this.isReadonly = false,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double fieldWidth = screenWidth * 314 / 430;
    double fieldHeight = screenHeight * 56 / 932;
    double fontSize = fontSizeText ?? 14;
    //  screenWidth > 800 ?
    //  fontSizeText!=null?
    //  fontSizeText!.sp*0.5 : 14.sp
    // : fontSizeText!=null?fontSizeText!.sp : 14.sp; // Use ScreenUtil for font scaling

    return SizedBox(
      width: fieldWidth,
      height: heightTextFormField ?? fieldHeight,
      child: TextFormField(
        readOnly: isReadonly,
        maxLines: maxLines,
        keyboardType: isNum
            ? const TextInputType.numberWithOptions(decimal: true)
            : TextInputType.text,
        textDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
        controller: controller,
        textAlign: textAlign,
        style: TextStyle(
          height: 1.2,
          fontSize: getResponsiveText(fontSize, context),
          color: Colors.black,
        ),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 20),
          filled: true,
          fillColor: Colors.white,
          hintText: hintText,
          hintStyle: TextStyle(
            height: 1.2,
            fontSize: getResponsiveText(fontSize, context),
            color: hintTextColor ?? ColorManager.grey,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.black,
              width: 4,
            ),
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
