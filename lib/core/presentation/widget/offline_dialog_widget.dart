import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lailaty/core/resources/color_manager.dart';
import 'package:lailaty/core/resources/string_manager.dart';
import 'package:lailaty/core/resources/style_maneger.dart';
import 'package:lailaty/core/utils/build_context_extensions.dart';

class OfflineDialogWidget extends StatelessWidget {
  const OfflineDialogWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: ColorManager.backGroundColor,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.wifi_off,
            color: ColorManager.errorColor,
            size: 70,
          ),
          SizedBox(
            height: context.screenHeight * 0.01,
          ),
          Text(
            StringManager.makeSureYouAreConnectedToTheInternet,
            style: StyleManager.normalText18(
              size: context.screenWidth * 0.04,
            ),
          ),
          SizedBox(
            height: context.screenHeight * 0.02,
          ),
          Center(
            child: InkWell(
              onTap: () {
                context.pop();
              },
              child: Container(
                width: context.screenWidth * 0.3,
                height: context.screenHeight * 0.05,
                decoration: BoxDecoration(
                  color: ColorManager.grey1,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                  child: Text(
                    StringManager.ok,
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
        ],
      ),
    );
  }
}
