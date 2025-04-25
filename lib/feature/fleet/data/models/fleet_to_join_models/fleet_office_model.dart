import 'package:lailaty/feature/fleet/domain/entities/fleet_to_join/fleet_office_entity.dart';

class FleetOfficeModel {
  final int id;
  final int userId;
  final String name;
  final String phoneNumber;
  final String latitude;
  final String longitude;
  final DateTime createdAt;
  final DateTime? updatedAt;

  const FleetOfficeModel({
    required this.id,
    required this.userId,
    required this.name,
    required this.phoneNumber,
    required this.latitude,
    required this.longitude,
    required this.createdAt,
    required this.updatedAt,
  });

  /// Convert from JSON to Model
  factory FleetOfficeModel.fromJson(Map<String, dynamic> json) {
    return FleetOfficeModel(
      id: json["id"],
      userId: json["user_id"],
      name: json["name"],
      phoneNumber: json["phone_number"],
      latitude: json["latitude"],
      longitude: json["longitude"],
      createdAt: DateTime.parse(json["created_at"]),
      updatedAt: json["updated_at"] != null
          ? DateTime.parse(json["updated_at"])
          : null,
    );
  }

  /// Convert Model to JSON
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "user_id": userId,
      "name": name,
      "phone_number": phoneNumber,
      "latitude": latitude,
      "longitude": longitude,
      "created_at": createdAt.toIso8601String(),
      "updated_at": updatedAt?.toIso8601String(),
    };
  }

  /// Convert Model to Entity
  FleetOfficeEntity toEntity() {
    return FleetOfficeEntity(
      id: id,
      userId: userId,
      name: name,
      phoneNumber: phoneNumber,
      latitude: latitude,
      longitude: longitude,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

  /// Convert Entity to Model
  static FleetOfficeModel fromEntity(FleetOfficeEntity entity) {
    return FleetOfficeModel(
      id: entity.id,
      userId: entity.userId,
      name: entity.name,
      phoneNumber: entity.phoneNumber,
      latitude: entity.latitude,
      longitude: entity.longitude,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    );
  }
}
