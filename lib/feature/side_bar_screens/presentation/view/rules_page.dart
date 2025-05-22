import 'package:flutter/material.dart';
import 'package:lailaty/core/presentation/widget/custom_appbar.dart';
import 'package:lailaty/core/resources/string_manager.dart';

class RulesPage extends StatelessWidget {
  const RulesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title:StringManager.serviceRules,ispop: false,),
      body: Container(),
    );
  }
}
