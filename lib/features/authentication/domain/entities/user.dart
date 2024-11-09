import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String phoneNumber;
  final String password;
  final String firstName;
  final String lastName;

  const User({
    required this.phoneNumber,
    required this.password,
    required this.firstName,
    required this.lastName,
  });

  @override
  List<Object?> get props => [phoneNumber, password, firstName, lastName];
}
