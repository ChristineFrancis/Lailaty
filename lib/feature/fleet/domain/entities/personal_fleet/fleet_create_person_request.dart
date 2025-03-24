// curl --location '127.0.0.1:8000/api/v1/captain/offices/create/personal' \
// --header 'Accept: application/json' \
// --form 'name="name"' \
// --form 'phone_number="+209362871323"' \
// --form 'latitude="40.7128"' \
// --form 'longitude="74.0060"'

import 'package:equatable/equatable.dart';

class FleetCreatePersonRequest extends Equatable {
  final String name;
  final double latitude;
  final double longitude;
  final String phoneNumber;

  const FleetCreatePersonRequest({
    required this.longitude,
    required this.phoneNumber,
    required this.name,
    required this.latitude,
  });

  @override
  List<Object?> get props => [
        name,
        latitude,
        longitude,
        phoneNumber,
      ];
}
