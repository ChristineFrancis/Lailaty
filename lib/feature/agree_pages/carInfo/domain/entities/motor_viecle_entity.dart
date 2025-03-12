import 'dart:io';

import 'package:equatable/equatable.dart';

class MotorInfoBaseEntity extends Equatable {
  final String model_year;
  final String license_plate;

  final File image_1;

  final File face_1;
  final File face_2;

  MotorInfoBaseEntity(
      {required this.model_year,
      required this.license_plate,
      required this.image_1,
      required this.face_1,
      required this.face_2});

  @override
  List<Object> get props =>
      [model_year, license_plate, image_1.path, face_1.path, face_2.path];
}
