import 'package:flutter/material.dart';
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
  // Widget? prefixWidget;
  // Widget? suffixWidget;
  
   CustomTextFormFieldName(
      {super.key, required this.controller, required this.hintText , this.hintTextColor , this.isArabic=false, this.textAlign=TextAlign.end,
      this.fontSizeText , this.heightTextFormField , this.isNum=false , this.maxLines=1, this.isReadonly=false
      //this.prefixWidget , this.suffixWidget
      });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double fieldWidth = screenWidth * 0.8;
    double fieldheight = screenHeight * 0.05;
    double fontSize = screenWidth * 0.07;
    return SizedBox(
      width: fieldWidth,
      height:heightTextFormField?? fieldheight,
      child: TextFormField(
        readOnly: isReadonly,
        maxLines: maxLines,
        keyboardType:isNum ? const TextInputType.numberWithOptions(decimal: true) : TextInputType.text ,
        textDirection:isArabic? TextDirection.rtl :TextDirection.ltr, 
        controller: controller,
        textAlign: textAlign,
        style:
            TextStyle(height: screenHeight * 0.001, fontSize: fontSize * 0.8),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 20),
          filled: true,
          fillColor: Colors.white,
          hintText: hintText,
          // prefix: prefixWidget ?? Container(),
          // suffixIcon: suffixWidget?? Container() ,
          // suffix:suffixWidget?? Container() ,
          hintStyle: TextStyle(
             height: 1.2,
              fontSize:fontSizeText?? fontSize * 0.8,
              color:hintTextColor?? ColorManager.grey), // Hint covers entire field
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
