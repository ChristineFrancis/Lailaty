import 'package:lailaty/core/resources/api_key_manager.dart';
import 'package:lailaty/feature/fleet/domain/entities/personal_fleet/fleet_create_person_request.dart';

class FleetCreatePersonRequestModel {
  final String name;
  final double latitude;
  final double longitude;
  final String phoneNumber;

  const FleetCreatePersonRequestModel({
    required this.name,
    required this.latitude,
    required this.longitude,
    required this.phoneNumber,
  });

  /// Convert from JSON to Model
  factory FleetCreatePersonRequestModel.fromJson(Map<String, dynamic> json) {
    return FleetCreatePersonRequestModel(
      name: json[ApiKeyManager.name],
      latitude: double.parse(json[ApiKeyManager.latitude].toString()),
      longitude: double.parse(json[ApiKeyManager.longitude].toString()),
      phoneNumber: json[ApiKeyManager.phoneNumber],
    );
  }

  /// Convert Model to JSON
  Map<String, dynamic> toJson() {
    return {
      ApiKeyManager.name: name,
      ApiKeyManager.latitude: latitude.toString(),
      ApiKeyManager.longitude: longitude.toString(),
      ApiKeyManager.phoneNumber: phoneNumber,
    };
  }

  /// Convert Model to Entity
  FleetCreatePersonRequest toEntity() {
    return FleetCreatePersonRequest(
      name: name,
      latitude: latitude,
      longitude: longitude,
      phoneNumber: phoneNumber,
    );
  }

  /// Convert Entity to Model
  static FleetCreatePersonRequestModel fromEntity(
      FleetCreatePersonRequest entity) {
    return FleetCreatePersonRequestModel(
      name: entity.name,
      latitude: entity.latitude,
      longitude: entity.longitude,
      phoneNumber: entity.phoneNumber,
    );
  }
}
