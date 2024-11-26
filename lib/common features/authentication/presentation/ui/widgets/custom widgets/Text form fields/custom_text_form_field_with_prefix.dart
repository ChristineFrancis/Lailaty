import 'package:flutter/material.dart';

class CustomTextFormFieldWithPrefix extends StatelessWidget {
  final TextEditingController controller;
  final String prefixText;
  final String hintText;

  const CustomTextFormFieldWithPrefix({
    super.key,
    required this.controller,
    required this.prefixText,
    required this.hintText,
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
        keyboardType: TextInputType.phone,
        textAlign: TextAlign.start,
        style: TextStyle(
          height: screenHeight * 0.001,
          fontSize: fontSize,
        ),
        decoration: InputDecoration(
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 10, right: 5),
            child: Text(
              prefixText,
              style: TextStyle(
                fontSize: fontSize,
                color: Colors.black,
              ),
            ),
          ),
          prefixIconConstraints: const BoxConstraints(
            minWidth: 0,
            minHeight: 0,
          ),
          hintText: hintText,
          contentPadding: const EdgeInsets.symmetric(vertical: 15),
          filled: true,
          fillColor: Colors.white,
          hintStyle: TextStyle(
            //height: 2.65,
            fontSize: fontSize * 0.9, // Hint font size slightly smaller
            color: Colors.grey,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.black, width: 3),
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
