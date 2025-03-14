import 'dart:io';
import 'package:lailaty/core/resources/api_key_manager.dart';
import 'package:lailaty/feature/agree_pages/carInfo/domain/entities/captain_registration_documents_request.dart';

class CaptainRegistrationDocumentsModel {
  final File personalImage;
  final File driverLicenseFrontFace;
  final File driverLicenseBackFace;
  final File personalCardFrontFace;
  final File personalCardBackFace;
  final File? criminalRecord;
  final String birthDate;

  const CaptainRegistrationDocumentsModel({
    required this.personalImage,
    required this.driverLicenseFrontFace,
    required this.driverLicenseBackFace,
    required this.personalCardFrontFace,
    required this.personalCardBackFace,
    this.criminalRecord,
    required this.birthDate,
  });

  /// Convert from JSON to Model
  factory CaptainRegistrationDocumentsModel.fromJson(
      Map<String, dynamic> json) {
    return CaptainRegistrationDocumentsModel(
      personalImage: File(json[ApiKeyManager.personalImage]),
      driverLicenseFrontFace: File(json[ApiKeyManager.driverLicenseFrontFace]),
      driverLicenseBackFace: File(json[ApiKeyManager.driverLicenseBackFace]),
      personalCardFrontFace: File(json[ApiKeyManager.personalCardFrontFace]),
      personalCardBackFace: File(json[ApiKeyManager.personalCardBackFace]),
      criminalRecord: json[ApiKeyManager.criminalRecord] != null
          ? File(json[ApiKeyManager.criminalRecord])
          : null,
      birthDate: json[ApiKeyManager.birthDate],
    );
  }

  /// Convert Model to JSON
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

  /// Convert Model to Entity
  CaptainRegistrationDocumentsRequest toEntity() {
    return CaptainRegistrationDocumentsRequest(
      personalImage: personalImage,
      driverLicenseFrontFace: driverLicenseFrontFace,
      driverLicenseBackFace: driverLicenseBackFace,
      personalCardFrontFace: personalCardFrontFace,
      personalCardBackFace: personalCardBackFace,
      criminalRecord: criminalRecord,
      birthDate: birthDate,
    );
  }

  /// Convert Entity to Model
  static CaptainRegistrationDocumentsModel fromEntity(
      CaptainRegistrationDocumentsRequest entity) {
    return CaptainRegistrationDocumentsModel(
      personalImage: entity.personalImage,
      driverLicenseFrontFace: entity.driverLicenseFrontFace,
      driverLicenseBackFace: entity.driverLicenseBackFace,
      personalCardFrontFace: entity.personalCardFrontFace,
      personalCardBackFace: entity.personalCardBackFace,
      criminalRecord: entity.criminalRecord,
      birthDate: entity.birthDate,
    );
  }
}
