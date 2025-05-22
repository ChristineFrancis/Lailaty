import 'dart:io';
import 'package:lailaty/feature/agree_pages/carInfo/domain/entities/motorcycle_registration_request_entity.dart';

class MotorcycleRegistrationRequestModel {
  final String modelYear;
  final String licensePlate;
  final File image1;
  final File face1;
  final File face2;

  const MotorcycleRegistrationRequestModel({
    required this.modelYear,
    required this.licensePlate,
    required this.image1,
    required this.face1,
    required this.face2,
  });

  /// لتحويل البيانات إلى JSON (للاستخدام عند الحاجة بصيغة key-value)
  Map<String, dynamic> toJson() {
    return {
      'model_year': modelYear,
      'license_plate': licensePlate,
      'image_1': image1.path,
      'face_1': face1.path,
      'face_2': face2.path,
    };
  }

  /// لتحويل النموذج إلى الـ Entity الموازي
  MotorcycleRegistrationRequest toEntity() {
    return MotorcycleRegistrationRequest(
      modelYear: modelYear,
      licensePlate: licensePlate,
      image1: image1,
      face1: face1,
      face2: face2,
    );
  }

  /// لإنشاء النموذج من الـ Entity
  static MotorcycleRegistrationRequestModel fromEntity(MotorcycleRegistrationRequest entity) {
    return MotorcycleRegistrationRequestModel(
      modelYear: entity.modelYear,
      licensePlate: entity.licensePlate,
      image1: entity.image1,
      face1: entity.face1,
      face2: entity.face2,
    );
  }
}
