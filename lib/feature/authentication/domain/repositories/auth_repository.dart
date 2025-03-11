import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:lailaty/core/resources/api_key_manager.dart';

import '../../../../core/error_manager/failures.dart';
import '../entities/auth_request.dart';
import '../entities/auth_response.dart';
import '../entities/forgot_password_request.dart';
import '../entities/forgot_password_response.dart';
import '../entities/login_request.dart';
import '../entities/login_response.dart';
import '../entities/resend_verification_request.dart';
import '../entities/resend_verification_response.dart';
import '../entities/verify_email_request.dart';
import '../entities/verify_email_response.dart';

abstract class AuthRepository {
  Future<Either<Failure, AuthResponse>> register(AuthRequest request);
  Future<Either<Failure, VerifyEmailResponse>> verifyEmail(
      VerifyEmailRequest request);
  Future<Either<Failure, ResendVerificationResponse>> resendVerificationCode(
      ResendVerificationRequest request);
  Future<Either<Failure, LoginResponse>> login(LoginRequest request);
  Future<Either<Failure, ForgotPasswordResponse>> forgotPassword(
      ForgotPasswordRequest request);
//!  captain :
  // Future<Either<Failure, CaptainRegistrationDocumentsResponseMessage>>
  //     captainRegister(CaptainRegistrationDocumentsRequest request);
}

//?
//! captain request entity :
class CaptainRegistrationDocumentsRequest extends Equatable {
  final File personalImage;
  final File driverLicenseFrontFace;
  final File driverLicenseBackFace;
  final File personalCardFrontFace;
  final File personalCardBackFace;
  final File? criminalRecord;
  final String birthDate;

  const CaptainRegistrationDocumentsRequest({
    required this.personalImage,
    required this.driverLicenseFrontFace,
    required this.driverLicenseBackFace,
    required this.personalCardFrontFace,
    required this.personalCardBackFace,
    this.criminalRecord,
    required this.birthDate,
  });

  @override
  List<Object?> get props => [
        personalImage,
        driverLicenseFrontFace,
        driverLicenseBackFace,
        personalCardFrontFace,
        personalCardBackFace,
        criminalRecord,
        birthDate,
      ];
}

//captain response :
class CaptainRegistrationDocumentsResponseMessage extends Equatable {
  final String message;

  const CaptainRegistrationDocumentsResponseMessage({required this.message});

  @override
  List<Object> get props => [message];
}

//!captain use case :

// class CaptainRegisterUseCase {
//   final AuthRepository repository; // this repo up there or any other repo

//   CaptainRegisterUseCase({required this.repository});
//   Future<Either<Failure, CaptainRegistrationDocumentsResponseMessage>> call(
//       CaptainRegistrationDocumentsRequest request) async {
//     return await repository.captainRegister(request);
//   }
// }

//! captain response model:
class CaptainRegistrationDocumentsModel
    extends CaptainRegistrationDocumentsRequest {
  const CaptainRegistrationDocumentsModel({
    required super.personalImage,
    required super.driverLicenseFrontFace,
    required super.driverLicenseBackFace,
    required super.personalCardFrontFace,
    required super.personalCardBackFace,
    super.criminalRecord,
    required super.birthDate,
  });

  // Factory method to create an instance from JSON
  factory CaptainRegistrationDocumentsModel.fromJson(
      Map<String, dynamic> json) {
    return CaptainRegistrationDocumentsModel(
      personalImage: File(json[ApiKeyManager.personalImage] as String),
      driverLicenseFrontFace:
          File(json[ApiKeyManager.driverLicenseFrontFace] as String),
      driverLicenseBackFace:
          File(json[ApiKeyManager.driverLicenseBackFace] as String),
      personalCardFrontFace:
          File(json[ApiKeyManager.personalCardFrontFace] as String),
      personalCardBackFace:
          File(json[ApiKeyManager.personalCardBackFace] as String),
      criminalRecord: json[ApiKeyManager.criminalRecord] != null
          ? File(json[ApiKeyManager.criminalRecord] as String)
          : null,
      birthDate: json[ApiKeyManager.birthDate] as String,
    );
  }

  // Convert the instance to JSON
  Map<String, dynamic> toJson() {
    return {
      ApiKeyManager.personalImage: personalImage.path,
      ApiKeyManager.driverLicenseFrontFace: driverLicenseFrontFace.path,
      ApiKeyManager.driverLicenseBackFace: driverLicenseBackFace.path,
      ApiKeyManager.personalCardFrontFace: personalCardFrontFace.path,
      ApiKeyManager.personalCardBackFace: personalCardBackFace.path,
      ApiKeyManager.criminalRecord: criminalRecord?.path,
      ApiKeyManager.birthDate: birthDate,
    };
  }
}


//? >: RegistrationErrors
// class EmailRegistrationResponseModel extends AuthResponse with EquatableMixin {
//   //Todo : try to remove equatable if needed
//   const EmailRegistrationResponseModel({required super.message});

//   factory EmailRegistrationResponseModel.fromJson(Map<String, dynamic> json) {
//     return EmailRegistrationResponseModel(
//       message: json['message'] as String, //todo : remove as string
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {'message': message};
//   }

//   @override
//   List<Object?> get props => [message];
// }
