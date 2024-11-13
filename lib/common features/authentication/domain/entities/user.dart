import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String email;
  final String phoneNumber;
  final String password;
  final String firstName;
  final String lastName;

  const User({
    required this.email,
    required this.phoneNumber,
    required this.password,
    required this.firstName,
    required this.lastName,
  });

  @override
  List<Object?> get props => [email,phoneNumber, password, firstName, lastName];
}
