import 'package:flutter/material.dart';
import 'package:lailaty/core/resources/color_manager.dart';
import 'package:lailaty/core/resources/string_manager.dart';
import 'package:lailaty/core/utils/build_context_extensions.dart';

class NextBotton extends StatelessWidget {
  final void Function()? onTap;
  final String? text;
  const NextBotton({
    super.key,
    this.onTap,
    this.text,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.screenHeight * 0.1,
      child: Center(
        child: InkWell(
          onTap: onTap,
          child: Container(
            width: context.screenWidth * 0.8,
            height: context.screenHeight * 0.05,
            decoration: BoxDecoration(
              color: ColorManager.grey1,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Center(
              child: Text(
                text ?? StringManager.next,
                style: TextStyle(
                  fontSize: context.screenWidth * 0.05,
                  color: ColorManager.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
