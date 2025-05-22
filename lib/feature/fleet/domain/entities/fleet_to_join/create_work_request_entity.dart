import 'package:equatable/equatable.dart';

class CreateWorkRequestEntity extends Equatable {
  final int id;
  final int userId;
  final int officeId;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;

  const CreateWorkRequestEntity({
    required this.id,
    required this.userId,
    required this.officeId,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory CreateWorkRequestEntity.fromJson(Map<String, dynamic> json) {
    return CreateWorkRequestEntity(
      id: json['id'],
      userId: json['user_id'],
      officeId: json['office_id'],
      status: json['status'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  @override
  List<Object?> get props => [
        id,
        userId,
        officeId,
        status,
        createdAt,
        updatedAt,
      ];
}

// class CreateWorkRequestResponse {
//   final CreateWorkRequestEntity request;

//   CreateWorkRequestResponse({required this.request});

//   factory CreateWorkRequestResponse.fromJson(Map<String, dynamic> json) {
//     return CreateWorkRequestResponse(
//       request: CreateWorkRequestEntity.fromJson(json['request']),
//     );
//   }
// }
