
import 'package:lailaty/common%20features/authentication/domain/entities/verification_code.dart';

class VerificationModel extends VerificationCode {
  const VerificationModel({required super.verificationCode});

  factory VerificationModel.fromJson(Map<String, dynamic> json) {
    return VerificationModel(verificationCode: json['verificationCode']);
  }

  Map<String, dynamic> toJson() {
    return {'verificationCode': verificationCode};
  }
}
