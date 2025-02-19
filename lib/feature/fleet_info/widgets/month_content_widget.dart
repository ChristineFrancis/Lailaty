import 'package:flutter/material.dart';
import 'package:lailaty/core/resources/string_manager.dart';
import 'package:lailaty/core/resources/style_maneger.dart';
import 'package:lailaty/core/utils/build_context_extensions.dart';

class MonthContentWidget extends StatelessWidget {
  const MonthContentWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            StringManager.profits,
            style: StyleManager.semiboldTextStyle20(
              size: context.screenWidth * 0.05,
            ),
          ),
          Text(
            StringManager.numberOfFlights,
            style: StyleManager.semiboldTextStyle20(
              size: context.screenWidth * 0.05,
            ),
          ),
          Text(
            StringManager.mostActive,
            style: StyleManager.semiboldTextStyle20(
              size: context.screenWidth * 0.05,
            ),
          ),
        ],
      ),
    );
  }
}
