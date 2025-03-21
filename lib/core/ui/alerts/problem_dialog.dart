import 'package:flutter/material.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/widgets/custom%20widgets/text%20widgets/custom_text_widget.dart';
import 'package:lailaty/core/resources/color_manager.dart';

class ProblemDialog extends StatelessWidget {
  final String message;

  const ProblemDialog({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.sizeOf(context).width;
    return AlertDialog(
      icon: Icon(
        Icons.close_rounded,
        size: screenWidth * 0.15,
      ),
      iconColor: Colors.red,
      title: CustomTextWidget(text: message, fontSize: 16, color: Colors.black),
      //content: Text(message),
      actions: [
        Center(
          child: InkWell(
            onTap: () {
              Navigator.of(context).pop();
              print("HSHHHHHHHHHHH");
            },
            child: SizedBox(
              width: screenWidth * 0.3,
              height: screenWidth * 0.1,
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: ColorManager.greyForSwitch,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: CustomTextWidget(
                  text: 'حسناً',
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
