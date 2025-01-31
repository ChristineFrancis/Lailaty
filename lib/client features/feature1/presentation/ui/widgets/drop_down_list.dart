import 'package:flutter/material.dart';
import 'package:lailaty/common%20features/authentication/presentation/ui/widgets/custom%20widgets/text%20widgets/custom_text_arial.dart';

class DropDownList extends StatefulWidget {
  final List<String> myList;
  final String hint;
  final double percentageOfDropdown;

  const DropDownList({
    super.key,
    required this.myList,
    required this.hint,
    required this.percentageOfDropdown,
  });

  @override
  State<DropDownList> createState() => _DropDownListState();
}

class _DropDownListState extends State<DropDownList> {
  String? selectedValue;
  final GlobalKey _dropdownKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.black, width: 2),
          borderRadius: BorderRadius.circular(9),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            key: _dropdownKey,
            borderRadius: BorderRadius.circular(9),
            isExpanded: true,
            elevation: 0,
            style: TextStyle(
              fontSize: getResponsiveText(20, context),
              color: Colors.black,
            ),
            hint: Text(
              widget.hint,
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            icon: const Icon(
              Icons.arrow_drop_down,
              color: Colors.black,
              size: 30,
            ),
            dropdownColor: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
            menuMaxHeight: MediaQuery.of(context).size.height *
                widget.percentageOfDropdown,
            value: selectedValue,
            onChanged: (String? newValue) {
              setState(() {
                selectedValue = newValue;
              });
            },
            selectedItemBuilder: (BuildContext context) {
              return widget.myList.map<Widget>((String value) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(value),
                  ],
                );
              }).toList();
            },
            items: widget.myList.asMap().entries.map((entry) {
              int index = entry.key;
              String value = entry.value;
              return DropdownMenuItem<String>(
                value: value,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Column(
                      children: [
                        Text(value),
                        // Only show divider if it's not the last item
                        if (index != widget.myList.length - 1)
                          Container(
                            height: 1,
                            color: Colors.black,
                          ),
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
