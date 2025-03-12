import '../../domain/entities/login_response.dart';

class LoginResponseModel extends LoginResponse {
  const LoginResponseModel({
    required super.message,
    required super.accessToken,
    required super.refreshToken,
    required super.user,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      message: json['message'] as String,
      accessToken: json['access_token'] as String,
      refreshToken: json['refresh_token'] as String,
      user: json['user'] as Map<String, dynamic>,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'access_token': accessToken,
      'refresh_token': refreshToken,
      'user': user,
    };
  }

  @override
  List<Object> get props => [message, accessToken, refreshToken, user];
}
