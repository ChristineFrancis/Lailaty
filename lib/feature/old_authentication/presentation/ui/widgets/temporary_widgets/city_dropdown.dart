// // ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:lailaty/core/resources/color_manager.dart';
import 'package:lailaty/feature/old_authentication/presentation/ui/widgets/custom%20widgets/text%20widgets/custom_text_widget.dart';

class CityDropdown extends StatefulWidget {
  final List<String> cities; // List of cities passed via the constructor
  const CityDropdown({super.key, required this.cities});

  @override
  _CityDropdownState createState() => _CityDropdownState();
}

class _CityDropdownState extends State<CityDropdown> {
  late String selectedCity;

  @override
  void initState() {
    super.initState();
    selectedCity = widget.cities.first;
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        height: 60,
        margin: EdgeInsets.symmetric(
            horizontal: MediaQuery.sizeOf(context).width / 5),
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 2),
          borderRadius: BorderRadius.circular(8.0),
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const SizedBox(width: 8),
                CustomTextWidget(
                    text: 'مصر',
                    color: Colors.black,
                    fontSize: getResponsiveText(22, context),
                    fontWeight: FontWeight.w600),
                // Text(
                //   'مصر', // Display the selected city
                //   style: const TextStyle(fontSize: 18),
                // ),
                const SizedBox(width: 8),
                Text(
                  '🇪🇬', // Fixed flag
                  style: const TextStyle(fontSize: 20),
                ),
                const SizedBox(width: 8),
                Container(
                  width: 2,
                  height: 40,
                  color: ColorManager.grey1,
                ),
                //const SizedBox(width: 8),
              ],
            ),
            DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                focusColor: Colors.white,
                dropdownColor: Colors.white,
                icon: const Icon(
                  Icons.arrow_drop_down_sharp,
                  color: Colors.black,
                  size: 35,
                ),
                value: selectedCity,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedCity = newValue!;
                  });
                },
                items:
                    widget.cities.map<DropdownMenuItem<String>>((String city) {
                  return DropdownMenuItem<String>(
                    value: city,
                    child: CustomTextWidget(
                        text: city,
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w400),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
