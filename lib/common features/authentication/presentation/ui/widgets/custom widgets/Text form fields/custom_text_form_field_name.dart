import 'package:flutter/material.dart';
import 'package:lailaty/core/resources/color_manager.dart';

class CustomTextFormFieldName extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  // Widget? prefixWidget;
  // Widget? suffixWidget;
  
   CustomTextFormFieldName(
      {super.key, required this.controller, required this.hintText , 
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
      height: fieldheight,
      child: TextFormField(
        controller: controller,
        textAlign: TextAlign.end,
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
              fontSize: fontSize * 0.8,
              color: ColorManager.grey), // Hint covers entire field
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
