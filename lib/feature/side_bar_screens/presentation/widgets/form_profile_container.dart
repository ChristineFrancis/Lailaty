import 'package:flutter/material.dart';
import 'package:lailaty/core/resources/color_manager.dart';
import 'package:lailaty/core/resources/style_maneger.dart';
import 'package:lailaty/core/utils/build_context_extensions.dart';
import 'package:lailaty/feature/side_bar_screens/presentation/widgets/custom_text_form_field.dart';

class FormProfileContainer extends StatelessWidget {
  final TextEditingController _controller;
  final String title;
  final String hintText;
  // final String errorMessage;
  // final String? Function(String?)? customValidator;
  final TextInputType keyboardType;
  const FormProfileContainer({
    super.key,
    required TextEditingController controller,
    required this.title,
    required this.hintText,
    // required this.errorMessage,
    // this.customValidator,
    this.keyboardType = TextInputType.text,
  }) : _controller = controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      width: context.screenWidth,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(12),
          bottomRight: Radius.circular(12),
        ),
        border: Border(
          bottom: BorderSide(
            width: 2,
            color: ColorManager.shadowColor,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            title,
            style: StyleManager.boldTextStyle24(
              size: context.screenWidth * 0.05,
            ),
          ),
          SizedBox(
            height: context.screenHeight * 0.02,
          ),
          Center(
            child: CustomTextFormField(
             // errorMessage: errorMessage,
              controller: _controller,
              hintText: hintText,
            //  customValidator: customValidator,
              keyboardType: keyboardType,
            ),
          ),
          SizedBox(
            height: context.screenHeight * 0.02,
          ),
        ],
      ),
    );
  }
}
