import 'dart:io';
import 'package:equatable/equatable.dart';

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
