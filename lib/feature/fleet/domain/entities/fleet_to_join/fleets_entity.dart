import 'package:equatable/equatable.dart';
import 'package:lailaty/feature/fleet/domain/entities/fleet_to_join/fleet_office_entity.dart';

class GetAllFleetEntity extends Equatable {
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
  final FleetOfficeEntity office;
  final String? image;

  const GetAllFleetEntity({
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

  factory GetAllFleetEntity.fromJson(Map<String, dynamic> json) {
    return GetAllFleetEntity(
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
      office: FleetOfficeEntity.fromJson(json['office']),
      image: json['image'],
    );
  }

  @override
  List<Object?> get props => [
        id,
        email,
        phoneNumber,
        firstName,
        lastName,
        gender,
        deviceToken,
        birthDate,
        canCreateOffice,
        createdAt,
        updatedAt,
        imageUrl,
        roleName,
        officeId,
        isFullRegistered,
        hasDocuments,
        rate,
        office,
        image,
      ];
}
