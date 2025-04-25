import '../../domain/entities/verify_email_response.dart';

class VerifyEmailResponseModel extends VerifyEmailResponse {
  const VerifyEmailResponseModel({
    required super.message,
    required super.accessToken,
    required super.refreshToken,
    required super.user,
  });

  factory VerifyEmailResponseModel.fromJson(Map<String, dynamic> json) {
    return VerifyEmailResponseModel(
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
