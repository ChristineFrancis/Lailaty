import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lailaty/core/presentation/widget/Titles.dart';
// import 'package:lailaty/core/config/widget/Titles.dart';
import 'package:lailaty/core/resources/style_maneger.dart';

class TextMoveY extends StatelessWidget {
  String text;
  TextMoveY({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 100.0),
      child: Align(
        alignment: Alignment.topCenter,
        child: HeaderText(
          text: text,
          styleOfText: StyleManager.normalText18(fontWeight: FontWeight.w400),
        )
            .animate()
            .moveY(
                duration: 2.seconds,
                begin: MediaQuery.of(context).size.height / 10,
                end: MediaQuery.of(context).size.height / 100)
            .hide(),
      ),
    );
  }
}
