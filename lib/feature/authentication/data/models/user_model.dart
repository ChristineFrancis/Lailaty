import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final int id;
  final String email;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String gender;
  final DateTime birthDate;
  final String city;
  final String role;
  final String deviceToken;
  final bool hasDocuments;
  final num? officeId;     // from backend: office_id

  const UserModel({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.gender,
    required this.birthDate,
    required this.city,
    required this.role,
    required this.deviceToken,
    required this.hasDocuments,
    required this.officeId,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    // Check both keys for role.
    final roleValue = json['role_name'] ?? json['role'] ?? 'client';

    // Handle has_documents whether it is sent as a bool or a string.
    final hasDocumentsValue = json['has_documents'];
    bool hasDocuments;
    if (hasDocumentsValue is bool) {
      hasDocuments = hasDocumentsValue;
    } else if (hasDocumentsValue is String) {
      hasDocuments = hasDocumentsValue.toLowerCase() == 'true';
    } else {
      hasDocuments = false;
    }

    return UserModel(
      id: json['id'] as int,
      email: json['email'] as String,
      firstName: json['first_name'] as String? ?? '',
      lastName: json['last_name'] as String? ?? '',
      phoneNumber: json['phone_number'] as String? ?? '',
      gender: json['gender'] as String? ?? '',
      birthDate: json['birth_date'] != null
          ? DateTime.parse(json['birth_date'] as String)
          : DateTime(1900, 1, 1),
      city: json['city'] as String? ?? 'egypt',
      role: roleValue,
      deviceToken: json['deviceToken'] as String? ?? '',
      hasDocuments: hasDocuments,
      officeId: json['office_id'] as num?, // if missing, stays null
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'first_name': firstName,
      'last_name': lastName,
      'phone_number': phoneNumber,
      'gender': gender,
      'birth_date': birthDate.toIso8601String(),
      'city': city,
      // Save role with the correct key so your decider can use it later.
      'role_name': role,
      'deviceToken': deviceToken,
      'has_documents': hasDocuments,
      'office_id': officeId,
    };
  }

  @override
  List<Object?> get props => [
        id,
        email,
        firstName,
        lastName,
        phoneNumber,
        gender,
        birthDate,
        city,
        role,
        deviceToken,
        hasDocuments,
        officeId,
      ];
}





// user :{id: 14, email: sanaaltarabishi20@gmail.com, phone_number: +200936287134, first_name: sana, last_name: ta, gender: female, deviceToken: qwerasdfzxcv, birth_date: 2000-08-02T00:00:00.000000Z, can_create_office: 0, created_at: 2025-03-09T11:04:52.000000Z, updated_at: 2025-03-09T13:57:36.000000Z, image_url: null, role_name: fleetOwner, office_id: 1, is_full_registered: true, has_documents: true, rate: 0, roles: [{id: 2, name: fleetOwner, guard_name: api, created_at: 2025-02-19T17:44:01.000000Z, updated_at: 2025-02-19T17:44:01.000000Z, pivot: {model_type: App\Models\User, model_id: 14, role_id: 2}}], image: null}