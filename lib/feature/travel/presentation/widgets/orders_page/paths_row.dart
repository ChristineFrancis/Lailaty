import 'package:flutter/material.dart';
import 'package:lailaty/core/resources/color_manager.dart';
import 'package:lailaty/core/resources/string_manager.dart';
import 'package:lailaty/core/resources/style_maneger.dart';
import 'package:lailaty/core/utils/build_context_extensions.dart';
import 'package:lailaty/core/presentation/widget/dynamic_page_view_widgets/letter_circle.dart';

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
  List<String> selectedPaths = [];
  bool showPathOptions = false;

  final List<String> availablePaths = [
    "المسار ١",
    "المسار ٢",
    "المسار ٣",
    "المسار ٤",
    "المسار ٥"
  ];

  void _togglePathSelection() {
    setState(() {
      showPathOptions = !showPathOptions;
    });
  }

  void _selectPath(String path) {
    if (!selectedPaths.contains(path)) {
      setState(() {
        selectedPaths.add(path);
        showPathOptions = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.isTravelPage
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: _togglePathSelection,
                    icon: const Icon(
                      Icons.add,
                      color: ColorManager.black,
                      size: 30,
                    ),
                  ),
                  SizedBox(width: context.screenWidth * 0.02),
                  // Text(
                  //   StringManager.paths,
                  //   style: StyleManager.semiboldTextStyle20(
                  //     size: context.screenWidth * 0.05,
                  //   ),
                  // ),
                  // SizedBox(width: context.screenWidth * 0.02),
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      reverse: true,
                      child: Text(
                        selectedPaths.isNotEmpty
                            ? selectedPaths.reversed.join(" - ")
                            : StringManager.paths,
                        textDirection: TextDirection.rtl,
                        style: StyleManager.semiboldTextStyle20(
                          size: context.screenWidth * 0.045,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: context.screenWidth * 0.02),
                  const LetterCircle(
                    backGroundColor: ColorManager.brightGreen,
                    letter: StringManager.bLetter,
                  ),
                ],
              ),
              if (showPathOptions)
                Container(
                  padding: const EdgeInsets.all(8),
                  margin: const EdgeInsets.only(top: 8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: ColorManager.grey1),
                  ),
                  child: Column(
                    children: availablePaths
                        .map(
                          (path) => ListTile(
                            title: Text(
                              path,
                              textDirection: TextDirection.rtl,
                            ),
                            onTap: () => _selectPath(path),
                          ),
                        )
                        .toList(),
                  ),
                ),
            ],
          )
        : const SizedBox.shrink();
  }
}
