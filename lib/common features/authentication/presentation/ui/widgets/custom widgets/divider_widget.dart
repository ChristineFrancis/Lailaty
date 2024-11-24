// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class DividerWidget extends StatelessWidget {
  final double thk;
  const DividerWidget({
    super.key,
    required this.thk,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenWidth * 0.9,
      height: thk,
      color: Colors.black,
    );
  }
}
