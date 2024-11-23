// // ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:lailaty/core/resources/color_manager.dart';

class CityDropdown extends StatefulWidget {
  final List<String> cities; // List of cities passed via the constructor
  const CityDropdown({super.key, required this.cities});

  @override
  _CityDropdownState createState() => _CityDropdownState();
}

class _CityDropdownState extends State<CityDropdown> {
  late String selectedCity; // Holds the currently selected city

  @override
  void initState() {
    super.initState();
    // Set the default selected city to the first city in the list
    selectedCity = widget.cities.first;
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl, // Arabic text direction
      child: Container(
        height: 60,
        margin: EdgeInsets.symmetric(horizontal: MediaQuery.sizeOf(context).width/5),
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black , width: 2),
          borderRadius: BorderRadius.circular(8.0),
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Fixed flag on the left
            Row(
              children: [
                
                const SizedBox(width: 8),
                Text(
                  'مصر', // Display the selected city
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(width: 8),
                Text(
                  '🇪🇬', // Fixed flag
                  style: const TextStyle(fontSize: 20),
                ),
                const SizedBox(width: 8),
                Container(
                  width: 2,
                  height: 40,
                  color:ColorManager.grey ,
                ),
                //const SizedBox(width: 8),
              ],
            ),
            DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                focusColor: Colors.white,
                dropdownColor:Colors.white ,
                icon: const Icon(Icons.arrow_drop_down_sharp , color: Colors.black, size:35,),
                value: selectedCity,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedCity = newValue!;
                  });
                },
                items: widget.cities.map<DropdownMenuItem<String>>((String city) {
                  return DropdownMenuItem<String>(
                    
                    value: city,
                    child: Text(
                      city,
                      style: const TextStyle(fontSize: 18),
                    ),
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

// import 'package:flutter/material.dart';

// class CityDropdown extends StatefulWidget {
//   @override
//   _CityDropdownState createState() => _CityDropdownState();
// }

// class _CityDropdownState extends State<CityDropdown> {
//   // Selected city
//   String selectedCity = 'مصر'; // Default selection

//   // List of cities
//   final List<Map<String, String>> cities = [
//     {'name': 'مصر', 'flag': '🇪🇬'},
//     {'name': 'السعودية', 'flag': '🇸🇦'},
//     {'name': 'الإمارات', 'flag': '🇦🇪'},
//     {'name': 'الكويت', 'flag': '🇰🇼'},
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Directionality(
//       textDirection: TextDirection.rtl, // To make it RTL for Arabic
//       child: Container(
//         padding: const EdgeInsets.symmetric(horizontal: 10.0),
//         decoration: BoxDecoration(
//           border: Border.all(color: Colors.grey),
//           borderRadius: BorderRadius.circular(8.0),
//           color: Colors.white,
//         ),
//         child: DropdownButtonHideUnderline(
//           child: DropdownButton<String>(
//             value: selectedCity,
//             icon: const Icon(Icons.arrow_drop_down),
//             onChanged: (String? newValue) {
//               setState(() {
//                 selectedCity = newValue!;
//               });
//             },
//             items: cities.map<DropdownMenuItem<String>>((Map<String, String> city) {
//               return DropdownMenuItem<String>(
//                 value: city['name'],
//                 child: Row(
//                   children: [
//                     Text(
//                       city['flag']!,
//                       style: const TextStyle(fontSize: 18),
//                     ),
//                     const SizedBox(width: 8),
//                     Text(
//                       city['name']!,
//                       style: const TextStyle(fontSize: 16),
//                     ),
//                   ],
//                 ),
//               );
//             }).toList(),
//           ),
//         ),
//       ),
//     );
//   }
// }

// void main() {
//   runApp(MaterialApp(
//     home: Scaffold(
//       appBar: AppBar(title: Text('City Selector')),
//       body: Center(
//         child: CityDropdown(),
//       ),
//     ),
//   ));
// }
