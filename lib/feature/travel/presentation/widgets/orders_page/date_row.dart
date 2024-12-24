import 'package:flutter/material.dart';
import 'package:lailaty/core/resources/color_manager.dart';
import 'package:lailaty/core/resources/string_manager.dart';
import 'package:lailaty/core/resources/style_maneger.dart';
import 'package:lailaty/core/utils/build_context_extensions.dart';

//! will be a 11/12/200 and 8:00? or just date ?
class DateRow extends StatelessWidget {
  const DateRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          StringManager.when,
          style: StyleManager.semiboldTextStyle20(
            size: context.screenWidth * 0.05,
          ),
        ),
        SizedBox(
          width: context.screenWidth * 0.03,
        ),
        const Icon(
          Icons.date_range,
          color: ColorManager.black,
          size: 35,
        ),
      ],
    );
  }
}
