import 'package:equatable/equatable.dart';
import '../../domain/entities/auth_response.dart';

class EmailRegistrationResponseModel extends AuthResponse with EquatableMixin {
  const EmailRegistrationResponseModel({required super.message});

  factory EmailRegistrationResponseModel.fromJson(Map<String, dynamic> json) {
    return EmailRegistrationResponseModel(
      message: json['message'] as String, 
    );
  }

  Map<String, dynamic> toJson() {
    return {'message': message};
  }

  @override
  List<Object?> get props => [message];
}
