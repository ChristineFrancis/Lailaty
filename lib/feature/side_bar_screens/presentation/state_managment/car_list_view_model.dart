import 'dart:io';
import 'package:file_selector/file_selector.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lailaty/core/resources/string_manager.dart';
import 'package:lailaty/feature/side_bar_screens/data/car_info.dart';

class CarListViewModel extends ChangeNotifier {

  final List<CarInfo> _cars = [
    CarInfo(name: StringManager.carNameExample, image: null),
  ];


  List<CarInfo> get cars => List.unmodifiable(_cars);


  void addCar({String? name, File? image}) {
    _cars.add(CarInfo(name: name ?? '', image: image));
    notifyListeners();
  }


  void editCar(int index, {String? name, File? image}) {
    final car = _cars[index];
    if (name != null) car.name = name;
    if (image != null) car.image = image;
    notifyListeners();
  }


  void deleteCar(int index) {
    _cars.removeAt(index);
    notifyListeners();
  }

  Future<File?> pickImage() async {
    try {
      if (Platform.isAndroid || Platform.isIOS) {
        final ImagePicker picker = ImagePicker();
        final XFile? pickedFile = await picker.pickImage(
          source: ImageSource.gallery,
        );

        return pickedFile != null ? File(pickedFile.path) : null;
      } else if (Platform.isWindows || Platform.isMacOS || Platform.isLinux) {
        final XFile? image = await openFile(
          acceptedTypeGroups: [
            const XTypeGroup(
              label: 'images',
              extensions: ['jpg', 'png', 'jpeg'],
            ),
          ],
        );

        return image != null ? File(image.path) : null;
      } else {
        throw UnsupportedError('This platform is not supported');
      }
    } catch (e) {
      debugPrint('Error picking image: $e');
      rethrow;
    }
  }
}
