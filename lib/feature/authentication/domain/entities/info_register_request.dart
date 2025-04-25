import 'package:equatable/equatable.dart';

class InfoRegisterRequest extends Equatable {
  final String email;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String gender;
  final String birthDate;
  final String city;
  final String role;
  final String deviceToken;

  const InfoRegisterRequest({
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.gender,
    required this.birthDate,
    required this.city,
    required this.role,
    required this.deviceToken,
  });

  @override
  List<Object> get props => [
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
