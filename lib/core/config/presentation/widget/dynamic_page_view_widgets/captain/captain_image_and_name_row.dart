import 'package:flutter/material.dart';
import 'package:lailaty/core/config/presentation/widget/imageProduct.dart';
import 'package:lailaty/core/resources/style_maneger.dart';
import 'package:lailaty/core/utils/build_context_extensions.dart';

class CaptianImageAndNameRow extends StatelessWidget {
  const CaptianImageAndNameRow({
    super.key,
    required this.captainName,
  });

  final String captainName;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          captainName,
          style: StyleManager.semiboldTextStyle20(
            size: context.screenWidth * 0.05,
          ),
        ),
        SizedBox(
          width: context.screenWidth * 0.03,
        ),
       ImageProduct(image: "d")
      ],
    );
  }
}
