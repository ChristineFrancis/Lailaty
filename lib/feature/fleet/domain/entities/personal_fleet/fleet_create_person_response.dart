// json
// {
//   "office": {//!!
//     "name": "name",
//     "phone_number": "+209362871323",
//     "latitude": "40.7128",
//     "longitude": "74.0060",
//     "user_id": 3,
//     "updated_at": "2025-03-20T14:58:48.000000Z",
//     "created_at": "2025-03-20T14:58:48.000000Z",
//     "id": 11,
//     "documents": null
//   }
// }

import 'package:equatable/equatable.dart';
import 'package:lailaty/feature/fleet/domain/entities/company_fleet/fleet_create_company_response_entity.dart';

class FleetCreatePersonalResponse extends Equatable {
  final int id;
  final String name;
  final String phoneNumber;
  final double latitude;
  final double longitude;
  final int userId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final OfficeDocuments? documents;
  const FleetCreatePersonalResponse({
    required this.id,
    required this.name,
    required this.phoneNumber,
    required this.latitude,
    required this.longitude,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
    this.documents,
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
