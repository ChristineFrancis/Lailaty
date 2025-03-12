import 'package:lailaty/feature/agree_pages/carInfo/domain/entities/motor_viecle_entity.dart';

class MotorInfoModel extends MotorInfoBaseEntity {
  MotorInfoModel(
      {required super.model_year,
      required super.license_plate,
      required super.image_1,
      required super.face_1,
      required super.face_2});

  factory MotorInfoModel.fromJson(Map<String, dynamic> json) {
    return MotorInfoModel(
      model_year: json["model_year"],
      license_plate: json["license_plate"],
      face_1: json["face_1"],
      face_2: json["face_2"],
      image_1: json["image_1"],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "model_year": model_year,
      "license_plate": license_plate,
      "face_1": face_1,
      "face_2": face_2,
      "image_1": image_1,
    };
  }
}
