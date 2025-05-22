import 'package:flutter/material.dart';
import 'package:lailaty/core/resources/color_manager.dart';
import 'package:lailaty/core/resources/string_manager.dart';
import 'package:lailaty/core/utils/build_context_extensions.dart';

class CustomerServiceRowWidget extends StatelessWidget {
  const CustomerServiceRowWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            //to navigate to somewhere !
          },
          child: Text(
            StringManager.serviceOfCleints,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: context.screenWidth * 0.03,
              color: ColorManager.blueTextColor,
            ),
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          StringManager.questionToContactWithClientService,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: context.screenWidth * 0.03,
          ),
        )
      ],
    );
  }
}
