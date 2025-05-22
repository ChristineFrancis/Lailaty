import 'package:lailaty/feature/fleet/domain/entities/fleet_to_join/create_work_request_entity.dart';

class CreateWorkRequestModel {
  final int id;
  final int userId;
  final int officeId;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;

  const CreateWorkRequestModel({
    required this.id,
    required this.userId,
    required this.officeId,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  /// Convert from JSON to Model
  factory CreateWorkRequestModel.fromJson(Map<String, dynamic> json) {
    return CreateWorkRequestModel(
      id: json['id'],
      userId: json['user_id'],
      officeId: json['office_id'],
      status: json['status'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  /// Convert Model to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'office_id': officeId,
      'status': status,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }

  /// Convert Model to Entity
  CreateWorkRequestEntity toEntity() {
    return CreateWorkRequestEntity(
      id: id,
      userId: userId,
      officeId: officeId,
      status: status,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

  /// Convert Entity to Model
  static CreateWorkRequestModel fromEntity(CreateWorkRequestEntity entity) {
    return CreateWorkRequestModel(
      id: entity.id,
      userId: entity.userId,
      officeId: entity.officeId,
      status: entity.status,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    );
  }
}
