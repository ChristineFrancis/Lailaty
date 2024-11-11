import 'package:flutter/material.dart';
import 'package:lailaty/feature/agreeScreens/presentation/view/personInfo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Personinfo();
  }
}