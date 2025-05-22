import 'package:flutter/material.dart';
import 'package:lailaty/core/presentation/widget/myButtonWidget.dart';
import 'package:lailaty/core/resources/color_manager.dart';
import 'package:lailaty/core/resources/style_maneger.dart';
import 'package:lailaty/core/utils/build_context_extensions.dart';

class EditableButtonField extends StatefulWidget {
  final String initialText;
  final Color buttonColor;
  final TextEditingController textEditingController;
  final bool isTextFieldVisible;
  final Function(bool) onToggle;
  final String hintText;
  const EditableButtonField({
    super.key,
    required this.initialText,
    required this.buttonColor,
    required this.textEditingController,
    required this.isTextFieldVisible,
    required this.onToggle,
    required this.hintText,
  });

  @override
  State<EditableButtonField> createState() => _EditableButtonFieldState();
}

class _EditableButtonFieldState extends State<EditableButtonField> {
  @override
  Widget build(BuildContext context) {
    return widget.isTextFieldVisible
        ? SizedBox(
            width: context.screenWidth * 0.7,
            height: context.screenHeight * 0.05,
            child: Center(
              child: TextField(
                controller: widget.textEditingController,
                textAlign: TextAlign.right,
                cursorColor: ColorManager.grey1,
                decoration: InputDecoration(
                  hintText: widget.hintText,
                  hintStyle: const TextStyle(color: ColorManager.grey1),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide:
                        const BorderSide(color: ColorManager.transparentColor),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide:
                        const BorderSide(color: ColorManager.transparentColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide:
                        const BorderSide(color: ColorManager.whiteColor),
                  ),
                  filled: true,
                  fillColor: ColorManager.whiteColor,
                ),
                maxLines: 1,
              ),
            ),
          )
        : MyButtonWidget(
            width: context.screenWidth * 0.7,
            height: context.screenHeight * 0.05,
            radius: 5,
            colors: ColorManager.whiteColor,
            widget: Center(
              child: Text(
                widget.initialText,
                style: StyleManager.boldTextStyle24(
                  size: context.screenHeight * 0.02,
                  color: Colors.black,
                ),
              ),
            ),
            onpress: () {
              widget.onToggle(true);
            },
          );
  }
}
