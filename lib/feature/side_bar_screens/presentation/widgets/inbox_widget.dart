import 'package:flutter/material.dart';
import 'package:lailaty/core/resources/color_manager.dart';
import 'package:lailaty/feature/old_splash/widgets/custom_text_widget.dart';

class InboxWidget extends StatelessWidget {
  final String service;
  final String fromTo;
  final String time;
  final String day;
  final bool visible;
  const InboxWidget(
      {super.key,
      required this.service,
      required this.fromTo,
      required this.time,
      required this.day,
      required this.visible});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Visibility(
          visible: visible,
          child: Center(
            child: Container(
              width: screenWidth * 0.12,
              height: screenHeight * 0.025,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: ColorManager.grey1,
                borderRadius: BorderRadius.circular(20),
              ),
              child: CustomTextWidget(
                  text: day, fontSize: 9, color: ColorManager.yellowTextColor),
            ),
          ),
        ),
        CustomTextWidget(text: service, fontSize: 21, color: Colors.black),
        CustomTextWidget(text: fromTo, fontSize: 19, color: Colors.black),
        Container(
            alignment: Alignment.centerLeft,
            child: CustomTextWidget(
                text: time, fontSize: 21, color: Colors.black)),
        Container(
          height: 2,
          width: screenWidth * 0.8,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            color: ColorManager.grey1,
          ),
        ),
      ],
    );
  }
}
