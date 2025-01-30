import 'package:flutter/material.dart';
import 'package:lailaty/core/resources/color_manager.dart';
import 'package:lailaty/core/utils/build_context_extensions.dart';

class CustomTextFormField extends StatelessWidget {
 // final String errorMessage;
  final TextEditingController controller;
  final TextInputType keyboardType;
 // final String? Function(String?)? customValidator;
  final String hintText;
  const CustomTextFormField({
    super.key,
   // required this.errorMessage,
    required this.controller,
    required this.hintText,
    this.keyboardType = TextInputType.text,
    //this.customValidator,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.screenWidth * 0.05),
      child: TextFormField(
        textAlign: TextAlign.right,
        controller: controller,
        keyboardType: keyboardType,
        cursorColor: ColorManager.grey1,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: ColorManager.black),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: ColorManager.grey1, width: 1.5),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: ColorManager.grey1, width: 1.5),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: ColorManager.grey1, width: 1.5),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide:
                const BorderSide(color: ColorManager.errorColor, width: 1.5),
          ),
        ),
        // validator: (value) {
        //   if (customValidator != null) {
        //     return customValidator!(value);
        //   }
        //   if (value == null || value.trim().isEmpty) {
        //     return errorMessage;
        //   }
        //   return null;
        // },
      ),
    );
  }
}
