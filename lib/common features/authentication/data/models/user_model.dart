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

  const UserModel(
      {required this.id,
      required this.email,
      required this.firstName,
      required this.lastName,
      required this.phoneNumber,
      required this.gender,
      required this.birthDate,
      required this.city,
      required this.role,
      required this.deviceToken});

  factory UserModel.fromJson(Map<String, dynamic> json) {
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
      role: json['role_name'] as String? ?? 'client',
      deviceToken: json['deviceToken'] as String? ?? '',
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
      'role': role,
      'deviceToken': deviceToken,
    };
  }

  @override
  List<Object> get props => [
        id,
        email,
        firstName,
        lastName,
        phoneNumber,
        gender,
        birthDate,
        city,
        role,
        deviceToken
      ];
}
