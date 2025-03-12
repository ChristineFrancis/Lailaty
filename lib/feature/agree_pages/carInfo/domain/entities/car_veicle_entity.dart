import 'dart:io';

import 'package:equatable/equatable.dart';

class CarViecleEntity extends Equatable {
  final String model_year;
  final String license_plate;
  final String more_than_four_seats;
  final int original_car_brand_id;
  final int car_brand_id;
  final String is_modified;
  final String gear_type;
  final String colore;
  final File image_1;
  final File image_2;
  final File image_3;
  final File image_4;
  final File image_5;
  final File face_1;
  final File face_2;

  CarViecleEntity(
      {required this.model_year,
      required this.license_plate,
      required this.more_than_four_seats,
      required this.original_car_brand_id,
      required this.car_brand_id,
      required this.is_modified,
      required this.gear_type,
      required this.colore,
      required this.image_1,
      required this.image_2,
      required this.image_3,
      required this.image_4,
      required this.image_5,
      required this.face_1,
      required this.face_2});
  @override
  List<Object> get props => [
        model_year,
        license_plate,
        more_than_four_seats,
        car_brand_id,
        gear_type,
        is_modified,
        image_1,
        image_2,
        image_3,
        image_4,
        image_5,
        face_1,
        face_2
      ];
}
