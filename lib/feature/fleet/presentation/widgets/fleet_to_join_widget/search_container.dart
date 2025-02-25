import 'package:flutter/material.dart';
import 'package:lailaty/core/resources/color_manager.dart';
import 'package:lailaty/core/resources/string_manager.dart';

class SearchContainer extends StatefulWidget {
  const SearchContainer({super.key});

  @override
  _SearchContainerState createState() => _SearchContainerState();
}

class _SearchContainerState extends State<SearchContainer> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: ColorManager.whiteColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: ColorManager.grey1, width: 2),
      ),
      child: TextField(
        cursorColor: ColorManager.grey1,
        controller: _controller,
        textAlign: TextAlign.right,
        decoration: const InputDecoration(
          hintText: StringManager.findTheNameOfTheFleet,
          hintStyle: TextStyle(color: Colors.grey),
          border: InputBorder.none,
          suffixIcon: Icon(Icons.search, color: ColorManager.grey1),
        ),
      ),
    );
  }
}
