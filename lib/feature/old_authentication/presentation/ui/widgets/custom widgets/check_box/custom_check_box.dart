import 'package:flutter/material.dart';
import 'package:lailaty/core/resources/color_manager.dart';

// ignore: must_be_immutable
class CustomCheckBox extends StatefulWidget {
  bool status;
  final Widget textwidget;
  CustomCheckBox({super.key, required this.status, required this.textwidget});

  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(width: 10,),
          Transform.scale(
            scale: 1.5,
            child: Checkbox(

              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              side: BorderSide(color: Colors.white, width: 1,  ),

              checkColor:ColorManager.yellowTextColor ,
              activeColor: ColorManager.grey1,
              focusColor:Colors.white ,
              value: widget.status,
              onChanged: (value) => setState(() { widget.status = value!;}),

            ),
          ),
          SizedBox(width: 10,),
          Expanded(
            child: widget.textwidget,
          ),
        ],
      ),
    );
  }
}