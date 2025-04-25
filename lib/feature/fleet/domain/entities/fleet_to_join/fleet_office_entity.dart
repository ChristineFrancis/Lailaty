import 'package:equatable/equatable.dart';

//? FleetOfficeEntity (Sub-entity):
class FleetOfficeEntity extends Equatable {
  final int id;
  final int userId;
  final String name;
  final String phoneNumber;
  final String latitude;
  final String longitude;
  final DateTime createdAt;
  final DateTime? updatedAt;

  const FleetOfficeEntity({
    required this.id,
    required this.userId,
    required this.name,
    required this.phoneNumber,
    required this.latitude,
    required this.longitude,
    required this.createdAt,
    required this.updatedAt,
  });

  factory FleetOfficeEntity.fromJson(Map<String, dynamic> json) {
    return FleetOfficeEntity(
      id: json['id'],
      userId: json['user_id'],
      name: json['name'],
      phoneNumber: json['phone_number'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'])
          : null,
    );
  }

  @override
  List<Object?> get props => [
        id,
        userId,
        name,
        phoneNumber,
        latitude,
        longitude,
        createdAt,
        updatedAt,
      ];
}
