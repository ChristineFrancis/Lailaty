// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lailaty/core/resources/asset_manager.dart';

import 'package:lailaty/core/resources/string_manager.dart';
import 'package:lailaty/feature/home_page/widgets/animation_loading_page.dart';
import 'package:lailaty/feature/home_page/widgets/textMovingY.dart';

class SearchOrderPage extends StatefulWidget {
  SearchOrderPage({
    Key? key,
  }) : super(key: key);

  @override
  _SearchOrderPageState createState() => _SearchOrderPageState();
}

class _SearchOrderPageState extends State<SearchOrderPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool showTrianggle = false;
  bool showSmallCircle1 = false;
  bool showSmallCircle2 = false;
  bool showSmallCircle3 = false;

  bool showSecondText = false;
  bool showThirdText = false;
  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..repeat();
    Future.delayed(
      const Duration(milliseconds: 500),
      () {
        if (mounted) {
          setState(() {
            showTrianggle = true;
          });
        }
      },
    );
    Future.delayed(
      const Duration(seconds: 2),
      () {
        if (mounted) {
          setState(() {
            showSmallCircle1 = true;
          });
        }
      },
    );
    Future.delayed(
      const Duration(seconds: 4),
      () {
        if (mounted) {
          setState(() {
            showSmallCircle2 = true;
          });
        }
      },
    );
    Future.delayed(
      const Duration(seconds: 6),
      () {
        if (mounted) {
          setState(() {
            showSmallCircle3 = true;
          });
        }
      },
    );
    Future.delayed(
      const Duration(seconds: 4),
      () {
        if (mounted) {
          setState(() {
            showSecondText = true;
          });
        }
      },
    );
    Future.delayed(
      const Duration(seconds: 7),
      () {
        if (mounted) {
          setState(() {
            showThirdText = true;
          });
        }
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          final angle = _controller.value * 2 * pi;
          return Stack(children: [
            CustomPaint(
              size: const Size(300, 1000),
              painter: LoadingAnimationPainter(angle, showTrianggle,
                  showSmallCircle1, showSmallCircle2, showSmallCircle3),
            ),
            TextMoveY(
              text: StringManager.startRecieveOrders,
            ),
            showSecondText
                ? TextMoveY(
                    text: StringManager.searchForClosingOrder,
                  )
                : const Text(""),
            showThirdText
                ? TextMoveY(
                    text: StringManager.searchInWidelyPlace,
                  )
                : const Text(""),
          ]);
        },
      ),
    ));
  }
}
