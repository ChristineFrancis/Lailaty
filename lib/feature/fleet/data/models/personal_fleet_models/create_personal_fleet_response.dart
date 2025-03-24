import 'package:lailaty/core/resources/api_key_manager.dart';
import 'package:lailaty/feature/fleet/data/models/fleet_company_models/fleet_create_company_response_model.dart';
import 'package:lailaty/feature/fleet/domain/entities/personal_fleet/fleet_create_person_response.dart';

class FleetCreatePersonalResponseModel {
  final int id;
  final String name;
  final String phoneNumber;
  final double latitude;
  final double longitude;
  final int userId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final OfficeDocumentsModel? documents;

  const FleetCreatePersonalResponseModel({
    required this.id,
    required this.name,
    required this.phoneNumber,
    required this.latitude,
    required this.longitude,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
    this.documents,
  });

  /// Convert from JSON to Model
  factory FleetCreatePersonalResponseModel.fromJson(Map<String, dynamic> json) {
    return FleetCreatePersonalResponseModel(
      id: json["id"],
      name: json[ApiKeyManager.name],
      phoneNumber: json[ApiKeyManager.phoneNumber],
      latitude: double.parse(json[ApiKeyManager.latitude].toString()),
      longitude: double.parse(json[ApiKeyManager.longitude].toString()),
      userId: json["user_id"],
      createdAt: DateTime.parse(json["created_at"]),
      updatedAt: DateTime.parse(json["updated_at"]),
      documents: json["documents"] != null
          ? OfficeDocumentsModel.fromJson(json["documents"])
          : null,
    );
  }

  /// Convert Model to JSON
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      ApiKeyManager.name: name,
      ApiKeyManager.phoneNumber: phoneNumber,
      ApiKeyManager.latitude: latitude.toString(),
      ApiKeyManager.longitude: longitude.toString(),
      "user_id": userId,
      "created_at": createdAt.toIso8601String(),
      "updated_at": updatedAt.toIso8601String(),
      "documents": documents?.toJson(),
    };
  }

  /// Convert Model to Entity
  FleetCreatePersonalResponse toEntity() {
    return FleetCreatePersonalResponse(
      id: id,
      name: name,
      phoneNumber: phoneNumber,
      latitude: latitude,
      longitude: longitude,
      userId: userId,
      createdAt: createdAt,
      updatedAt: updatedAt,
      documents: documents?.toEntity(),
    );
  }

  /// Convert Entity to Model
  static FleetCreatePersonalResponseModel fromEntity(
      FleetCreatePersonalResponse entity) {
    return FleetCreatePersonalResponseModel(
      id: entity.id,
      name: entity.name,
      phoneNumber: entity.phoneNumber,
      latitude: entity.latitude,
      longitude: entity.longitude,
      userId: entity.userId,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
      documents: entity.documents != null
          ? OfficeDocumentsModel.fromEntity(entity.documents!)
          : null,
    );
  }
}
