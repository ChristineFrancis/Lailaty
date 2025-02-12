import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lailaty/core/config/presentation/widget/myButton.dart';
import 'package:lailaty/core/resources/asset_manager.dart';
import 'package:lailaty/core/resources/color_manager.dart';
import 'package:lailaty/core/resources/string_manager.dart';
import 'package:lailaty/core/resources/style_maneger.dart';
import 'package:lailaty/core/utils/build_context_extensions.dart';

class NoOrdersWidget extends StatelessWidget {
  static final NoOrdersWidget _instance = NoOrdersWidget._internal();

  late VoidCallback _onRefresh;

  factory NoOrdersWidget({required VoidCallback onRefresh}) {
    _instance._onRefresh = onRefresh;
    return _instance;
  }

  NoOrdersWidget._internal();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              StringManager.noOrdersRightNow,
              style: StyleManager.boldTextStyle24(
                size: context.screenWidth * 0.06,
                color: ColorManager.black,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: context.screenHeight * 0.02),
            SvgPicture.asset(
              ImageAssetManager.noOrders,
              width: context.screenWidth * 0.5,
              height: context.screenWidth * 0.5,
            ),
            SizedBox(height: context.screenHeight * 0.02),
            MyButton(
              styleOfTExt: TextStyle(
                color: ColorManager.black,
                fontSize: context.screenHeight * 0.02,
                fontWeight: FontWeight.bold,
              ),
              radius: 10,
              height: context.screenHeight * 0.05,
              width: context.screenWidth * 0.3,
              colors: ColorManager.grey1,
              onpress: _onRefresh,
              title: StringManager.refresh,
            ),
          ],
        ),
      ),
    );
  }
}
