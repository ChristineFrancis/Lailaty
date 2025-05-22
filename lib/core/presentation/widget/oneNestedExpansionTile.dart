import 'package:flutter/material.dart';
import 'package:lailaty/core/presentation/widget/Titles.dart';
import 'package:lailaty/core/resources/color_manager.dart';
import 'package:lailaty/core/resources/style_maneger.dart';

class MyExpansionTile extends StatefulWidget {
  final String text1;
  final List<Widget> children;
  final Color primaryColor;

  const MyExpansionTile({
    super.key,
    required this.text1,
    required this.children,
    required this.primaryColor,
  });

  @override
  State<MyExpansionTile> createState() => _MyExpansionTileState();
}

class _MyExpansionTileState extends State<MyExpansionTile> {
  Key tileKey = UniqueKey();

  void _resetTile() {
    setState(() {
      tileKey = UniqueKey(); // إعادة بناء ExpansionTile
    });
  }

  @override
  Widget build(BuildContext context) {
    final updatedChildren = widget.children.map((child) {
      if (child is ListTile && child.onTap != null) {
        return ListTile(
          title: child.title,
          onTap: () {
            child.onTap!();
            _resetTile();
          },
        );
      }
      return child;
    }).toList();

    return ExpansionTile(
      key: tileKey,
      title: HeaderText(
        text: widget.text1,
        styleOfText: StyleManager.miniSmallText14(),
      ),
      backgroundColor: widget.primaryColor,
      collapsedShape: const ContinuousRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      shape: const ContinuousRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      collapsedBackgroundColor: widget.primaryColor,
      textColor: widget.primaryColor,
      iconColor: ColorManager.blackColor,
      children: updatedChildren,
    );
  }
}
