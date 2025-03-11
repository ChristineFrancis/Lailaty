import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final bool obscureText;
  final TextInputAction? textInputAction;
  final VoidCallback? onEditingComplete;
  final bool isEmail;
  final bool isNumbers;
  final bool hinted;
  final bool centered;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.labelText,
    this.obscureText = false,
    this.textInputAction,
    this.onEditingComplete,
    this.isEmail = false,
    this.isNumbers = false,
    this.hinted = false,
    this.centered = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      textInputAction: textInputAction,
      onEditingComplete: onEditingComplete,
      textAlign: centered ? TextAlign.center : TextAlign.start,
      keyboardType: isEmail
          ? TextInputType.emailAddress
          : isNumbers
              ? TextInputType.number
              : TextInputType.text,
      decoration: InputDecoration(
        labelText: hinted ? null : labelText,
        hintText: hinted ? labelText : null,
        labelStyle: TextStyle(color: Colors.grey[600]),
        hintStyle: TextStyle(color: Colors.grey),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7),
          borderSide: const BorderSide(
            color: Colors.black,
            width: 4,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.black, width: 2),
        ),
        fillColor: Colors.white,
        filled: true,
      ),
    );
  }
}
