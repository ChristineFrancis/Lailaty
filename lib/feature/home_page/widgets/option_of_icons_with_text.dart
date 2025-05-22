import 'package:flutter/material.dart';
import 'package:lailaty/core/presentation/widget/Titles.dart';
import 'package:lailaty/core/resources/string_manager.dart';
import 'package:lailaty/core/resources/style_maneger.dart';

class optionOfIconWithText extends StatelessWidget {
List <void Function()?> listOfOnTap=[];
   optionOfIconWithText({
    required this.listOfOnTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<Icon> iconList = [
      const Icon(Icons.location_on_outlined),
      const Icon(Icons.visibility_off_outlined),
      const Icon(Icons.warning),
    ];
    List<String> stringList = [
      StringManager.showMap,
      StringManager.disappear,
      StringManager.complaint,
    ];
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(
          iconList.length,
          (index) => Column(
            children: [
              IconButton(
                icon: iconList[index],
                onPressed:listOfOnTap[index],
              ),
              HeaderText(
                  text: stringList[index],
                  styleOfText: StyleManager.miniSmallText14()),
            ],
          ),
        ));
  }
}
