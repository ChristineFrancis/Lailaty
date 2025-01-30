import 'package:flutter/material.dart';
import 'package:lailaty/core/resources/color_manager.dart';
import 'package:lailaty/core/resources/string_manager.dart';
import 'package:lailaty/core/resources/style_maneger.dart';
import 'package:lailaty/core/utils/build_context_extensions.dart';

class NotifyNewOrdersRow extends StatefulWidget {
  const NotifyNewOrdersRow({
    super.key,
  });

  @override
  State<NotifyNewOrdersRow> createState() => _NotifyNewOrdersRowState();
}

class _NotifyNewOrdersRowState extends State<NotifyNewOrdersRow> {
  bool _isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SizedBox(
          width: context.screenWidth * 0.01,
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              _isSwitched = !_isSwitched;
            });
          },
          child: Container(
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(
              color: _isSwitched
                  ? ColorManager.greyWithMoreOpacity
                  : ColorManager.blackColor,
              border: Border.all(
                color: ColorManager.cardColor,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            width: context.screenWidth * 0.15,
            height: context.screenHeight * 0.04,
            child: AnimatedAlign(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeInOut,
              alignment:
                  _isSwitched ? Alignment.centerRight : Alignment.centerLeft,
              child: Container(
                width: context.screenHeight * 0.03,
                height: context.screenHeight * 0.03,
                decoration: BoxDecoration(
                  color: _isSwitched ? Colors.yellow : ColorManager.cardColor,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
        ),
        const Spacer(),
        Text(
          StringManager.notifyNewOrders,
          style: StyleManager.normalText18(
            size: context.screenWidth * 0.04,
          ),
        ),
      ],
    );
  }
}
