// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lailaty/core/resources/color_manager.dart';
import 'package:lailaty/core/utils/build_context_extensions.dart';

class ModeOfTransportCardWidget extends StatelessWidget {
  final String transportMode;
  final String image;
  final void Function() onTap;
  const ModeOfTransportCardWidget({
    super.key,
    required this.transportMode,
    required this.onTap,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: context.screenWidth * 0.45,
        height: context.screenWidth * 0.35,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: ColorManager.grey1,
          boxShadow: const [
            BoxShadow(
              color: ColorManager.dropShadowColor,
              offset: Offset(1, 1),
              blurRadius: 5,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              image,
              width: context.screenWidth * 0.25,
              height: context.screenWidth * 0.1,
            ),
            SizedBox(
              height: context.screenHeight * 0.02,
            ),
            Text(
              transportMode,
              style: TextStyle(
                fontSize: context.screenWidth * 0.06,
                fontWeight: FontWeight.bold,
                color: ColorManager.black,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
