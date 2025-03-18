import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final int id;
  final String email;
  //TODO: final String firstName;
  //TODO: final String lastName;

  const UserModel({required this.id, required this.email});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as int,
      email: json['email'] as String,
      //TODO: firstName: json['first_name'] as String? ?? '',
      //TODO: lastName: json['last_name'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      //'first_name':firstName,
      //'last_name':lastName,
    };
  }

  @override
  List<Object> get props => [id, email]; //[id , email , firstName , lastName];
}
