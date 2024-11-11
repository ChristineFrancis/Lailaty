import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int? id;
  final String phoneNumber;
  final String password;
  final String firstName;
  final String lastName;

  const User({
    this.id,
    required this.phoneNumber,
    required this.password,
    required this.firstName,
    required this.lastName,
  });

  @override
  List<Object?> get props => [id,phoneNumber, password, firstName, lastName];
}
