import '../../domain/entities/resend_verification_response.dart';

class ResendVerificationResponseModel extends ResendVerificationResponse {
  const ResendVerificationResponseModel({required super.message});

  factory ResendVerificationResponseModel.fromJson(Map<String, dynamic> json) {
    return ResendVerificationResponseModel(
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
