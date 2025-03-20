import 'package:flutter/material.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/widgets/custom%20widgets/text%20widgets/custom_text_widget.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final bool obscureText;
  final TextInputAction? textInputAction;
  final VoidCallback? onEditingComplete;
  final bool isEmail;
  final bool isNumbers;
  final bool isPhone;
  final bool hinted;
  final bool centered;
  final bool hasPrefix;
  final String prefixText;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.labelText,
    this.obscureText = false,
    this.textInputAction,
    this.onEditingComplete,
    this.isEmail = false,
    this.isNumbers = false,
    this.isPhone = false,
    this.hinted = false,
    this.centered = false,
    this.hasPrefix = false,
    this.prefixText = '',
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
              : isPhone
                  ? TextInputType.phone
                   : TextInputType.text,
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
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
        //!------------prefix
        prefixIcon: hasPrefix ? _prefixWidget(context) : null,
      ),
    );
  }

  Widget _prefixWidget(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * 60 / 430,
      child: Center(
        child: CustomTextWidget(
          text: prefixText,
          fontSize: 16,
          color: Colors.black,
        ),
      ),
    );
  }
}
