import 'dart:io';
import 'package:equatable/equatable.dart';

class FleetCreateCompanyRequestEntity extends Equatable {
  final String name;
  final double latitude;
  final double longitude;
  final String phoneNumber;
  final File commercialRegistrationCard;
  final File taxCard;

  const FleetCreateCompanyRequestEntity({
    required this.longitude,
    required this.phoneNumber,
    required this.commercialRegistrationCard,
    required this.taxCard,
    required this.name,
    required this.latitude,
  });

  @override
  List<Object?> get props => [
        name,
        latitude,
        longitude,
        phoneNumber,
        commercialRegistrationCard,
        taxCard,
      ];
}
