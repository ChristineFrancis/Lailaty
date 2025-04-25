import 'package:flutter/material.dart';
import 'package:lailaty/feature/old_authentication/presentation/ui/widgets/custom%20widgets/text%20widgets/custom_text_widget.dart';

class DetectGenderWidget extends StatefulWidget {
  final ValueChanged<bool> onGenderSelected;
  const DetectGenderWidget({super.key, required this.onGenderSelected});

  @override
  State<DetectGenderWidget> createState() => _DetectGenderWidgetState();
}

class _DetectGenderWidgetState extends State<DetectGenderWidget> {
  bool selectedGender = true; // Default value is "ذكر"

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width * 0.2;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: screenWidth,
          padding: EdgeInsets.only(left: screenWidth * 0.1),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.black, width: 2),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: DropdownButton<bool>(
            icon: Icon(
              Icons.arrow_drop_down,
              size: screenWidth * 0.4,
              color: Colors.black,
            ),
            value: selectedGender,
            underline: SizedBox(), // Removes default underline
            items: [
              DropdownMenuItem<bool>(
                value: true,
                child: CustomTextWidget(
                    text: 'ذكر', fontSize: 14, color: Colors.black),
              ),
              DropdownMenuItem<bool>(
                  value: false,
                  child: CustomTextWidget(
                      text: 'انثى', fontSize: 14, color: Colors.black)),
            ],
            onChanged: (value) {
              setState(() {
                selectedGender = value!;
              });
              widget.onGenderSelected(selectedGender);
            },
          ),
        ),
        CustomTextWidget(text: ":النوع", fontSize: 22, color: Colors.black)
      ],
    );
  }
}