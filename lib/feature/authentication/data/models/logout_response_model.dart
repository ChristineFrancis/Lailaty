import '../../domain/entities/logout_response.dart';

class LogoutResponseModel extends LogoutResponse {
  const LogoutResponseModel({required super.message});

  factory LogoutResponseModel.fromJson(Map<String, dynamic> json) {
    // The API returns an empty JSON; we supply a default message.
    return LogoutResponseModel(
        message: json['message'] ?? "Logged out successfully");
  }

  Map<String, dynamic> toJson() {
    return {'message': message};
  }

  @override
  List<Object> get props => [message];
}
