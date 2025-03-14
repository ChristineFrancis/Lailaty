import 'package:lailaty/feature/agree_pages/carInfo/domain/entities/captain_registration_documents_response_message.dart';

class CaptainRegistrationDocumentsResponseModel
    extends CaptainRegistrationDocumentsResponseMessage {
  const CaptainRegistrationDocumentsResponseModel({required super.message});

  /// Convert JSON to Model
  factory CaptainRegistrationDocumentsResponseModel.fromJson(
      Map<String, dynamic> json) {
    return CaptainRegistrationDocumentsResponseModel(
      message: json['message'] ?? "", // Ensures no null errors
    );
  }

  /// Convert Model to JSON
  Map<String, dynamic> toJson() {
    return {'message': message};
  }
}
