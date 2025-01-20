import 'package:flutter/material.dart';
import 'package:lailaty/core/resources/color_manager.dart';
import 'package:lailaty/core/resources/string_manager.dart';
import 'package:lailaty/core/resources/style_maneger.dart';
import 'package:lailaty/core/utils/build_context_extensions.dart';
import 'package:lailaty/core/config/presentation/widget/dynamic_page_view_widgets/letter_circle.dart';

class PathsRow extends StatefulWidget {
  final bool isTravelPage;
  const PathsRow({
    super.key,
    required this.isTravelPage,
  });

  @override
  State<PathsRow> createState() => _PathsRowState();
}

class _PathsRowState extends State<PathsRow> {
  late TextEditingController _controller;
  int _paths = 0;

  void _incrementPaths() {
    setState(() {
      _paths++;
      _controller.text = _paths.toString();
    });
  }

  void _updatePaths(String value) {
    final parsedValue = int.tryParse(value);
    if (parsedValue != null) {
      setState(() {
        _paths = parsedValue;
        _controller.text = _paths.toString();
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: _paths.toString());
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.isTravelPage
        ? Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: _incrementPaths,
                icon: const Icon(
                  Icons.add,
                  color: ColorManager.black,
                  size: 30,
                ),
              ),
              const Spacer(),
              Text(
                StringManager.paths,
                style: StyleManager.semiboldTextStyle20(
                  size: context.screenWidth * 0.05,
                ),
              ),
              SizedBox(
                width: context.screenWidth * 0.02,
              ),
              SizedBox(
                width: context.screenWidth * 0.1,
                child: TextField(
                  controller: _controller,
                  cursorColor: ColorManager.boldyellow,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: ColorManager.yellowTextColor,
                      ),
                    ),
                  ),
                  onSubmitted: _updatePaths,
                  style: StyleManager.semiboldTextStyle20(
                    size: context.screenWidth * 0.05,
                  ),
                  onChanged: _updatePaths,
                ),
              ),
              SizedBox(
                width: context.screenWidth * 0.02,
              ),
              const LetterCircle(
                backGroundColor: ColorManager.brightGreen,
                letter: StringManager.bLetter,
              ),
            ],
          )
        : const SizedBox.shrink();
  }
}
