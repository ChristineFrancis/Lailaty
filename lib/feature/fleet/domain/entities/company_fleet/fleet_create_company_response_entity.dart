//jsonResponse['office']
import 'package:equatable/equatable.dart';

class FleetCreateCompanyResponseEntity extends Equatable {
  final int id;
  final String name;
  final String phoneNumber;
  final double latitude;
  final double longitude;
  final int userId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final OfficeDocuments documents;
  const FleetCreateCompanyResponseEntity({
    required this.id,
    required this.name,
    required this.phoneNumber,
    required this.latitude,
    required this.longitude,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
    required this.documents,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        phoneNumber,
        latitude,
        longitude,
        userId,
        createdAt,
        updatedAt,
        documents,
      ];
}

//________ Sub-entity______________________________________________________

class OfficeDocuments extends Equatable {
  final int id;
  final int officeId;
  final String? taxCard;
  final String? commercialRegistrationCard;
  final String? insuranceCard;
  final String? valueAddedTaxCard;
  final String? attachedDocument;
  final DateTime createdAt;
  final DateTime updatedAt;
  const OfficeDocuments({
    required this.id,
    required this.officeId,
    this.taxCard,
    this.commercialRegistrationCard,
    this.insuranceCard,
    this.valueAddedTaxCard,
    this.attachedDocument,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [
        id,
        officeId,
        taxCard,
        commercialRegistrationCard,
        insuranceCard,
        valueAddedTaxCard,
        attachedDocument,
        createdAt,
        updatedAt,
      ];
}
