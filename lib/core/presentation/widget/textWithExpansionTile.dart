import 'package:flutter/material.dart';
import 'package:lailaty/core/presentation/widget/Titles.dart';
import 'package:lailaty/core/presentation/widget/oneNestedExpansionTile.dart';
import 'package:lailaty/core/resources/color_manager.dart';
import '../../resources/style_maneger.dart';

// class textWithExpansionTile extends StatelessWidget {
//   final String text;
//   final String textOfOption;
//   double widthOfExpansionTile;
//   textWithExpansionTile({
//     super.key,
//     required this.widthOfExpansionTile,
//     required this.text,
//     required this.textOfOption,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           FittedBox(
//             fit: BoxFit.scaleDown,
//             child: HeaderText(
//               text: text,
//               styleOfText: StyleManager.normalText18(color: ColorManager.black),
//             ),
//           ),
//           const SizedBox(
//             width: 11,
//           ),
//           Flexible(
//             // width: widthOfExpansionTile,
//             child: myExpansionTile(
//               text1: textOfOption,
//               primaryColor: ColorManager.whiteColor,
//               children: [],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

class TextWithExpansionTileSelector extends StatelessWidget {
  final String label;
  final String selectedValue;
  final List<String> options;
  final Function(String) onSelected;
  final double widthOfExpansionTile;

  const TextWithExpansionTileSelector({
    super.key,
    required this.label,
    required this.selectedValue,
    required this.options,
    required this.onSelected,
    this.widthOfExpansionTile = double.infinity,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          FittedBox(
            fit: BoxFit.scaleDown,
            child: HeaderText(
              text: label,
              styleOfText: StyleManager.normalText18(color: ColorManager.black),
            ),
          ),
          const SizedBox(width: 11),
          Flexible(
            child: MyExpansionTile(
              text1: selectedValue,
              primaryColor: ColorManager.whiteColor,
              children: options.map((option) {
                return ListTile(
                  title: Text(option, style: StyleManager.smallBlackText16()),
                  onTap: () => onSelected(option),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
