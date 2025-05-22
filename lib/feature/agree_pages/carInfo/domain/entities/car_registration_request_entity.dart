import 'dart:io';
import 'package:equatable/equatable.dart';

class CarRegistrationRequest extends Equatable {
  final String modelYear;
  final String licensePlate;
  final int carBrandId;
  final String gearType;
  final bool isModified;
  final int? originalCarBrandId; // only if modified
  final bool moreThanFourSeats;
  final String color;
  final File? image; // appears in non-modified request
  final File image1;
  final File image2;
  final File image3;
  final File image4;
  final File image5;
  final File face1;
  final File face2;

  const CarRegistrationRequest({
    required this.modelYear,
    required this.licensePlate,
    required this.carBrandId,
    required this.gearType,
    required this.isModified,
    this.originalCarBrandId,
    required this.moreThanFourSeats,
    required this.color,
    this.image,
    required this.image1,
    required this.image2,
    required this.image3,
    required this.image4,
    required this.image5,
    required this.face1,
    required this.face2,
  });

  @override
  List<Object?> get props => [
        modelYear,
        licensePlate,
        carBrandId,
        gearType,
        isModified,
        originalCarBrandId,
        moreThanFourSeats,
        color,
        image,
        image1,
        image2,
        image3,
        image4,
        image5,
        face1,
        face2,
      ];
}
