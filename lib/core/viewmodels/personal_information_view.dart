// import 'dart:io';
// import 'package:flutter/material.dart';

// class PersonalInformationView extends ChangeNotifier {
//   final Map<String, File?> _sectionImages = {};

//   File? getImage(String sectionId) => _sectionImages[sectionId];

//   void updateImage(String sectionId, File? image) {
//     _sectionImages[sectionId] = image;
//     print("Updated Image: $sectionId => ${image?.path}");
//     print("Current Map: $_sectionImages");
//     notifyListeners();
//   }

//   void clearImages() {
//     _sectionImages.clear();
//     print("Image map cleared.");
//     notifyListeners();
//   }
// }
