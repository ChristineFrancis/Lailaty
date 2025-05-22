import 'dart:io';
import 'package:lailaty/feature/agree_pages/carInfo/domain/entities/car_registration_request_entity.dart';

class CarRegistrationRequestModel {
  final String modelYear;
  final String licensePlate;
  final int carBrandId;
  final String gearType;
  final bool isModified;
  final int? originalCarBrandId;
  final bool moreThanFourSeats;
  final String color;
  final File? image;
  final File image1;
  final File image2;
  final File image3;
  final File image4;
  final File image5;
  final File face1;
  final File face2;

  const CarRegistrationRequestModel({
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

  /// Convert Model to JSON
  Map<String, dynamic> toJson() {
    return {
      'model_year': modelYear,
      'license_plate': licensePlate,
      'car_brand_id': carBrandId,
      'gear_type': gearType,
      'is_modified': isModified ? "1" : "0",
      'original_car_brand_id': originalCarBrandId,
      'more_than_four_seats': moreThanFourSeats ? "1" : "0",
      'color': color,
      'image': image?.path,
      'image_1': image1.path,
      'image_2': image2.path,
      'image_3': image3.path,
      'image_4': image4.path,
      'image_5': image5.path,
      'face_1': face1.path,
      'face_2': face2.path,
    };
  }

  /// Convert Model to Entity
  CarRegistrationRequest toEntity() {
    return CarRegistrationRequest(
      modelYear: modelYear,
      licensePlate: licensePlate,
      carBrandId: carBrandId,
      gearType: gearType,
      isModified: isModified,
      originalCarBrandId: originalCarBrandId,
      moreThanFourSeats: moreThanFourSeats,
      color: color,
      image: image,
      image1: image1,
      image2: image2,
      image3: image3,
      image4: image4,
      image5: image5,
      face1: face1,
      face2: face2,
    );
  }

  /// Convert Entity to Model
  static CarRegistrationRequestModel fromEntity(CarRegistrationRequest entity) {
    return CarRegistrationRequestModel(
      modelYear: entity.modelYear,
      licensePlate: entity.licensePlate,
      carBrandId: entity.carBrandId,
      gearType: entity.gearType,
      isModified: entity.isModified,
      originalCarBrandId: entity.originalCarBrandId,
      moreThanFourSeats: entity.moreThanFourSeats,
      color: entity.color,
      image: entity.image,
      image1: entity.image1,
      image2: entity.image2,
      image3: entity.image3,
      image4: entity.image4,
      image5: entity.image5,
      face1: entity.face1,
      face2: entity.face2,
    );
  }
}
