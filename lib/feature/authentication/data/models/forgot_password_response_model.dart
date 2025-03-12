import '../../domain/entities/forgot_password_response.dart';

class ForgotPasswordResponseModel extends ForgotPasswordResponse {
  const ForgotPasswordResponseModel({required String message})
      : super(message: message);

  factory ForgotPasswordResponseModel.fromJson(Map<String, dynamic> json) {
    return ForgotPasswordResponseModel(
      message: json['message'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
    };
  }

  @override
  List<Object> get props => [message];
}
