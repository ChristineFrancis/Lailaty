import 'package:flutter/material.dart';
import 'package:lailaty/core/resources/color_manager.dart';
import 'package:lailaty/core/resources/string_manager.dart';
import 'package:lailaty/core/utils/build_context_extensions.dart';

class ClientServiceRow extends StatelessWidget {
  const ClientServiceRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          StringManager.clientService,
          style: TextStyle(
            fontSize: context.screenWidth * 0.035,
            fontWeight: FontWeight.w500,
            color: ColorManager.blueTextColor,
          ),
        ),
        SizedBox(
          width: context.screenWidth * 0.02,
        ),
        Text(
          StringManager.questionToContactWithClientService,
          style: TextStyle(
            fontSize: context.screenWidth * 0.035,
            fontWeight: FontWeight.w500,
            color: ColorManager.black,
          ),
        ),
      ],
    );
  }
}
