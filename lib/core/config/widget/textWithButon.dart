// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TextWithButtonWidget extends StatelessWidget {
  VoidCallback? onPress;
  final String text;
  final String textbutton;
  final TextStyle styleOfButtonText;
  final TextStyle styleOfNormalText;

  TextWithButtonWidget({
    Key? key,
    this.onPress,
    required this.text,
    required this.textbutton,
    required this.styleOfButtonText,
    required this.styleOfNormalText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.zero,
      child: RichText(
          softWrap: true,
          maxLines: 12,
          overflow: TextOverflow.ellipsis,
          text: TextSpan(children: [
            TextSpan(
              text: text,
              style: styleOfNormalText,
            ),
            TextSpan(
                recognizer: TapGestureRecognizer()..onTap = onPress,
                style: styleOfButtonText,
                text: textbutton)
          ])),
    );
  }
}
