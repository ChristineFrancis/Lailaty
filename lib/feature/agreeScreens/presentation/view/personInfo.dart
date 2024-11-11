import 'package:flutter/material.dart';
import 'package:lailaty/core/config/widget/custom_appbar.dart';
import 'package:lailaty/core/resources/string_manager.dart';

class Personinfo extends StatelessWidget {
  const Personinfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
          isnNotification: false,
          ispop: true,
          title: StringManager.personalInfo),
      body:const Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            StringManager.profilePh,
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}
