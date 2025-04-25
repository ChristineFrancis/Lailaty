import 'package:lailaty/feature/fleet/data/models/fleet_to_join_models/fleet_office_model.dart';
import 'package:lailaty/feature/fleet/domain/entities/fleet_to_join/fleets_entity.dart';

class GetAllFleetModel {
  final int id;
  final String email;
  final String phoneNumber;
  final String firstName;
  final String lastName;
  final String gender;
  final String deviceToken;
  final DateTime birthDate;
  final int canCreateOffice;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String? imageUrl;
  final String roleName;
  final int officeId;
  final bool isFullRegistered;
  final bool hasDocuments;
  final int rate;
  final FleetOfficeModel office;
  final String? image;

  const GetAllFleetModel({
    required this.id,
    required this.email,
    required this.phoneNumber,
    required this.firstName,
    required this.lastName,
    required this.gender,
    required this.deviceToken,
    required this.birthDate,
    required this.canCreateOffice,
    required this.createdAt,
    required this.updatedAt,
    required this.imageUrl,
    required this.roleName,
    required this.officeId,
    required this.isFullRegistered,
    required this.hasDocuments,
    required this.rate,
    required this.office,
    required this.image,
  });

  /// Convert from JSON to Model
  factory GetAllFleetModel.fromJson(Map<String, dynamic> json) {
    return GetAllFleetModel(
      id: json['id'],
      email: json['email'],
      phoneNumber: json['phone_number'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      gender: json['gender'],
      deviceToken: json['deviceToken'],
      birthDate: DateTime.parse(json['birth_date']),
      canCreateOffice: json['can_create_office'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      imageUrl: json['image_url'],
      roleName: json['role_name'],
      officeId: json['office_id'],
      isFullRegistered: json['is_full_registered'],
      hasDocuments: json['has_documents'],
      rate: json['rate'],
      office: FleetOfficeModel.fromJson(json['office']),
      image: json['image'],
    );
  }

  /// Convert Model to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'phone_number': phoneNumber,
      'first_name': firstName,
      'last_name': lastName,
      'gender': gender,
      'deviceToken': deviceToken,
      'birth_date': birthDate.toIso8601String(),
      'can_create_office': canCreateOffice,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'image_url': imageUrl,
      'role_name': roleName,
      'office_id': officeId,
      'is_full_registered': isFullRegistered,
      'has_documents': hasDocuments,
      'rate': rate,
      'office': office.toJson(),
      'image': image,
    };
  }

  /// Convert Model to Entity
  GetAllFleetEntity toEntity() {
    return GetAllFleetEntity(
      id: id,
      email: email,
      phoneNumber: phoneNumber,
      firstName: firstName,
      lastName: lastName,
      gender: gender,
      deviceToken: deviceToken,
      birthDate: birthDate,
      canCreateOffice: canCreateOffice,
      createdAt: createdAt,
      updatedAt: updatedAt,
      imageUrl: imageUrl,
      roleName: roleName,
      officeId: officeId,
      isFullRegistered: isFullRegistered,
      hasDocuments: hasDocuments,
      rate: rate,
      office: office.toEntity(),
      image: image,
    );
  }

  /// Convert Entity to Model
  static GetAllFleetModel fromEntity(GetAllFleetEntity entity) {
    return GetAllFleetModel(
      id: entity.id,
      email: entity.email,
      phoneNumber: entity.phoneNumber,
      firstName: entity.firstName,
      lastName: entity.lastName,
      gender: entity.gender,
      deviceToken: entity.deviceToken,
      birthDate: entity.birthDate,
      canCreateOffice: entity.canCreateOffice,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
      imageUrl: entity.imageUrl,
      roleName: entity.roleName,
      officeId: entity.officeId,
      isFullRegistered: entity.isFullRegistered,
      hasDocuments: entity.hasDocuments,
      rate: entity.rate,
      office: FleetOfficeModel.fromEntity(entity.office),
      image: entity.image,
    );
  }
}
