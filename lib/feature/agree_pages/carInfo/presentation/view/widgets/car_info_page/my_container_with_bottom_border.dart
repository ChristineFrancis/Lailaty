import 'package:flutter/widgets.dart';

import '../../../../../../../core/resources/color_manager.dart';

class myContainerWithBottomBorder extends StatelessWidget {
  Widget contentWidget;
  myContainerWithBottomBorder({super.key, required this.contentWidget});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(15),
        decoration: const BoxDecoration(
          color: ColorManager.backGroundColor,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(12),
            bottomRight: Radius.circular(12),
          ),
          border: Border(
            bottom: BorderSide(
              width: 2,
              color: ColorManager.shadowColor,
            ),
          ),
        ),
        child: contentWidget);
  }
}
