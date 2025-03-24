import 'dart:io';
import 'package:lailaty/core/resources/api_key_manager.dart';
import 'package:lailaty/feature/fleet/domain/entities/company_fleet/fleet_create_company_request_entity.dart';

class FleetCreateCompanyRequestModel {
  final String name;
  final double latitude;
  final double longitude;
  final String phoneNumber;
  final File commercialRegistrationCard;
  final File taxCard;

  const FleetCreateCompanyRequestModel({
    required this.name,
    required this.latitude,
    required this.longitude,
    required this.phoneNumber,
    required this.commercialRegistrationCard,
    required this.taxCard,
  });

  /// Convert from JSON to Model
  factory FleetCreateCompanyRequestModel.fromJson(Map<String, dynamic> json) {
    return FleetCreateCompanyRequestModel(
      name: json[ApiKeyManager.name],
      latitude: double.parse(json[ApiKeyManager.latitude].toString()),
      longitude: double.parse(json[ApiKeyManager.longitude].toString()),
      phoneNumber: json[ApiKeyManager.phoneNumber],
      commercialRegistrationCard: File(-json[ApiKeyManager.commercialRegistrationCard]),
      taxCard: File(json[ApiKeyManager.taxCard]),
    );
  }

  /// Convert Model to JSON
  Map<String, dynamic> toJson() {
    return {
      ApiKeyManager.name: name,
      ApiKeyManager.latitude: latitude.toString(),
      ApiKeyManager.longitude: longitude.toString(),
      ApiKeyManager.phoneNumber: phoneNumber,
      ApiKeyManager.commercialRegistrationCard: commercialRegistrationCard.path,
      ApiKeyManager.taxCard: taxCard.path,
    };
  }

  /// Convert Model to Entity
  FleetCreateCompanyRequestEntity toEntity() {
    return FleetCreateCompanyRequestEntity(
      name: name,
      latitude: latitude,
      longitude: longitude,
      phoneNumber: phoneNumber,
      commercialRegistrationCard: commercialRegistrationCard,
      taxCard: taxCard,
    );
  }

  /// Convert Entity to Model
  static FleetCreateCompanyRequestModel fromEntity(FleetCreateCompanyRequestEntity entity) {
    return FleetCreateCompanyRequestModel(
      name: entity.name,
      latitude: entity.latitude,
      longitude: entity.longitude,
      phoneNumber: entity.phoneNumber,
      commercialRegistrationCard: entity.commercialRegistrationCard,
      taxCard: entity.taxCard,
    );
  }
}

