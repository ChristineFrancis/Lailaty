import 'package:flutter/material.dart';

class CustomTextFormFieldPassword extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;

  const CustomTextFormFieldPassword(
      {super.key, required this.controller, required this.hintText});

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
        obscureText: true,
        controller: controller,
        keyboardType: TextInputType.visiblePassword,
        textAlign: TextAlign.center,
        style: TextStyle(height: screenHeight * 0.001, fontSize: fontSize),
        decoration: InputDecoration(
          /*contentPadding: const EdgeInsets.symmetric(
                      vertical: 5), // Make the field thinner*/
          filled: true,
          fillColor: Colors.white,
          hintText: hintText,
          hintStyle: TextStyle(
              fontSize: fontSize,
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
