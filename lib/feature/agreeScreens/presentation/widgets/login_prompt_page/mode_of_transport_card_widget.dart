// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:lailaty/core/resources/color_manager.dart';
import 'package:lailaty/core/utils/build_context_extensions.dart';

import '../../../../../core/resources/key_manager.dart';

class ModeOfTransportCardWidget extends StatelessWidget {
  final String transportMode;
  final void Function() onTap;
  const ModeOfTransportCardWidget({
    super.key,
    required this.transportMode,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 200,
        height: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: ColorManager.cardColor,
          boxShadow: const [
            BoxShadow(
              color: ColorManager.dropShadowColor,
              offset: Offset(1, 1),
              blurRadius: 5,
            ),
          ],
        ),
        child: Column(
          children: [
            Text(
              transportMode,
              style: TextStyle(
                fontSize: context.screenWidth * 0.04,
                fontWeight: FontWeight.bold,
                color: ColorManager.yellowTextColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
