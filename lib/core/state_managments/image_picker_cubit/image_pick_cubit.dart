import 'dart:io';
import 'package:bloc/bloc.dart';

class PersonalInformationCubit extends Cubit<Map<String, File?>> {
  PersonalInformationCubit() : super({});

  // Get Image
  File? getImage(String sectionId) => state[sectionId];

  // Update Image
  void updateImage(String sectionId, File? image) {
    state[sectionId] = image;
    emit(Map.from(state));
    print("Updated Image: $sectionId => ${image?.path}");
    print("Current Map: $state");
  }

  void clearImages() {
    state.clear();
    emit({});
    print("Image map cleared.");
  }
}
//TODo: don't forget to use the clear function