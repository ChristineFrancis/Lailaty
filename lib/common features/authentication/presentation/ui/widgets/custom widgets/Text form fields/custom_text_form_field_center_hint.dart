import 'package:flutter/material.dart';

class CustomTextFormFieldCenterHint extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;


  const CustomTextFormFieldCenterHint({super.key, required this.controller, required this.hintText});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double fieldWidth = screenWidth * 0.6; 
    double fieldheight = screenHeight * 0.07; 
    double fontSize = screenWidth * 0.07; 
    return SizedBox(
              width: fieldWidth,
              height: fieldheight,
              child: TextFormField(
                controller: controller,
                textAlign: TextAlign.center,
                style:  TextStyle(
                    fontSize: fontSize*0.8), 
                decoration: InputDecoration(
                  /*contentPadding: const EdgeInsets.symmetric(
                      vertical: 5), // Make the field thinner*/
                  filled: true,
                  fillColor: Colors.white,
                  hintText: hintText,
                  hintStyle:  TextStyle(
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