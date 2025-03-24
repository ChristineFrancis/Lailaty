//! change these keys :

import 'package:lailaty/feature/fleet/domain/entities/fleet_create_company_response_entity.dart';

class FleetCreateCompanyResponseModel {
  final int id;
  final String name;
  final String phoneNumber;
  final double latitude;
  final double longitude;
  final int userId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final OfficeDocumentsModel documents;

  const FleetCreateCompanyResponseModel({
    required this.id,
    required this.name,
    required this.phoneNumber,
    required this.latitude,
    required this.longitude,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
    required this.documents,
  });

  /// Convert from JSON to Model
  factory FleetCreateCompanyResponseModel.fromJson(Map<String, dynamic> json) {
    return FleetCreateCompanyResponseModel(
      id: json['id'],
      name: json['name'],
      phoneNumber: json['phone_number'],
      latitude: double.parse(json['latitude'].toString()),
      longitude: double.parse(json['longitude'].toString()),
      userId: json['user_id'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      documents: OfficeDocumentsModel.fromJson(json['documents']),
    );
  }

  /// Convert Model to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'phone_number': phoneNumber,
      'latitude': latitude.toString(),
      'longitude': longitude.toString(),
      'user_id': userId,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'documents': documents.toJson(),
    };
  }

  /// Convert Model to Entity
  FleetCreateCompanyResponseEntity toEntity() {
    return FleetCreateCompanyResponseEntity(
      id: id,
      name: name,
      phoneNumber: phoneNumber,
      latitude: latitude,
      longitude: longitude,
      userId: userId,
      createdAt: createdAt,
      updatedAt: updatedAt,
      documents: documents.toEntity(),
    );
  }

  /// Convert Entity to Model
  static FleetCreateCompanyResponseModel fromEntity(FleetCreateCompanyResponseEntity entity) {
    return FleetCreateCompanyResponseModel(
      id: entity.id,
      name: entity.name,
      phoneNumber: entity.phoneNumber,
      latitude: entity.latitude,
      longitude: entity.longitude,
      userId: entity.userId,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
      documents: OfficeDocumentsModel.fromEntity(entity.documents),
    );
  }
}

//________ Sub-model______________________________________________________

class OfficeDocumentsModel {
  final int id;
  final int officeId;
  final String? taxCard;
  final String? commercialRegistrationCard;
  final String? insuranceCard;
  final String? valueAddedTaxCard;
  final String? attachedDocument;
  final DateTime createdAt;
  final DateTime updatedAt;

  const OfficeDocumentsModel({
    required this.id,
    required this.officeId,
    this.taxCard,
    this.commercialRegistrationCard,
    this.insuranceCard,
    this.valueAddedTaxCard,
    this.attachedDocument,
    required this.createdAt,
    required this.updatedAt,
  });

  /// Convert from JSON to Model
  factory OfficeDocumentsModel.fromJson(Map<String, dynamic> json) {
    return OfficeDocumentsModel(
      id: json['id'],
      officeId: json['office_id'],
      taxCard: json['tax_card'],
      commercialRegistrationCard: json['commercial_registration_card'],
      insuranceCard: json['insurance_card'],
      valueAddedTaxCard: json['value_added_tax_card'],
      attachedDocument: json['attached_document'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  /// Convert Model to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'office_id': officeId,
      'tax_card': taxCard,
      'commercial_registration_card': commercialRegistrationCard,
      'insurance_card': insuranceCard,
      'value_added_tax_card': valueAddedTaxCard,
      'attached_document': attachedDocument,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }

  /// Convert Model to Entity
  OfficeDocuments toEntity() {
    return OfficeDocuments(
      id: id,
      officeId: officeId,
      taxCard: taxCard,
      commercialRegistrationCard: commercialRegistrationCard,
      insuranceCard: insuranceCard,
      valueAddedTaxCard: valueAddedTaxCard,
      attachedDocument: attachedDocument,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

  /// Convert Entity to Model
  static OfficeDocumentsModel fromEntity(OfficeDocuments entity) {
    return OfficeDocumentsModel(
      id: entity.id,
      officeId: entity.officeId,
      taxCard: entity.taxCard,
      commercialRegistrationCard: entity.commercialRegistrationCard,
      insuranceCard: entity.insuranceCard,
      valueAddedTaxCard: entity.valueAddedTaxCard,
      attachedDocument: entity.attachedDocument,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    );
  }
}
