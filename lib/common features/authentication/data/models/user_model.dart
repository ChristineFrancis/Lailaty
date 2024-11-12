import 'package:lailaty/common%20features/authentication/domain/entities/user.dart';

class UserModel extends User {
  const UserModel({
    super.id,
    required super.phoneNumber,
    required super.password,
    required super.firstName,
    required super.lastName,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        // TODO: this May cause a crash
        id: json['id'],
        phoneNumber: json['phoneNumber'],
        password: json["password"],
        firstName: json["firstName"],
        lastName: json["lastName"]);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'phoneNumber': phoneNumber,
      'password': password,
      'firstName': firstName,
      'lastName': lastName,
    };
  }
}
