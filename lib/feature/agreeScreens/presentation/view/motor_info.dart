import 'package:flutter/material.dart';
import 'package:lailaty/core/config/widget/addPhoto.dart';
import 'package:lailaty/core/config/widget/custom_appbar.dart';
import 'package:lailaty/core/resources/string_manager.dart';
import 'package:lailaty/core/resources/style_maneger.dart';

class MotorInfoView extends StatelessWidget {
  const MotorInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppbar(ispop: true),
        body: Directionality(
            textDirection: TextDirection.rtl,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  addPhotoWidget(
                      numberOfAddPhotoContainer: 1,
                      title: StringManager.photoMotor,
                      styleOfText: StyleManager.normalText18(),
                      onPressed: () {})
                ],
              ),
            )));
  }
}
