import 'package:lailaty/feature/agree_pages/carInfo/domain/entities/vehicle_registration_response_entity.dart';

class VehicleRegistrationResponseModel {
  final VehicleModel vehicle;

  const VehicleRegistrationResponseModel({required this.vehicle});

  /// Convert from JSON to Model
  factory VehicleRegistrationResponseModel.fromJson(Map<String, dynamic> json) {
    return VehicleRegistrationResponseModel(
      vehicle: VehicleModel.fromJson(json['vehicle']),
    );
  }

  /// Convert Model to Entity
  VehicleRegistrationResponse toEntity() {
    return VehicleRegistrationResponse(vehicle: vehicle.toEntity());
  }

  /// Convert from Entity to Model
  static VehicleRegistrationResponseModel fromEntity(
      VehicleRegistrationResponse entity) {
    return VehicleRegistrationResponseModel(
        vehicle: VehicleModel.fromEntity(entity.vehicle));
  }
}

class VehicleModel {
  final int id;
  final String modelYear;
  final String? licensePlate;
  final String? gearType;
  final bool? isModified;
  final String? originalCarBrandId;
  final int? carBrandId;
  final bool? moreThanFourSeats;
  final int userId;
  final String? carBrand;
  final OriginalCarBrandModel? originalCarBrand;
  final int rate;
  final int? orderCount;
  final List<VehicleImageModel> image;
  final List<OwnershipDocumentModel> ownershipDocument;

  const VehicleModel({
    required this.id,
    required this.modelYear,
    this.licensePlate,
    this.gearType,
    this.isModified,
    this.originalCarBrandId,
    this.carBrandId,
    this.moreThanFourSeats,
    required this.userId,
    this.carBrand,
    this.originalCarBrand,
    required this.rate,
    this.orderCount,
    required this.image,
    required this.ownershipDocument,
  });

  factory VehicleModel.fromJson(Map<String, dynamic> json) {
    return VehicleModel(
      id: json['id'],
      modelYear: json['model_year'],
      licensePlate: json['license_plate'],
      gearType: json['gear_type'],
      isModified: json['is_modified'] == "1" || json['is_modified'] == 1,
      originalCarBrandId: json['original_car_brand_id']?.toString(),
      carBrandId: json['car_brand_id'] != null
          ? int.tryParse(json['car_brand_id'].toString())
          : null,
      moreThanFourSeats: json['more_than_four_seats'] == "1" ||
          json['more_than_four_seats'] == 1,
      userId: json['user_id'],
      carBrand: json['car_brand'],
      originalCarBrand: json['original_car_brand'] != null
          ? OriginalCarBrandModel.fromJson(json['original_car_brand'])
          : null,
      rate: json['rate'] ?? 0,
      orderCount: json['order_count'],
      image: (json['image'] as List<dynamic>?)
              ?.map((e) => VehicleImageModel.fromJson(e))
              .toList() ??
          [],
      ownershipDocument: (json['ownership_document'] as List<dynamic>?)
              ?.map((e) => OwnershipDocumentModel.fromJson(e))
              .toList() ??
          [],
    );
  }

  Vehicle toEntity() {
    return Vehicle(
      id: id,
      modelYear: modelYear,
      licensePlate: licensePlate,
      gearType: gearType,
      isModified: isModified,
      originalCarBrandId: originalCarBrandId,
      carBrandId: carBrandId,
      moreThanFourSeats: moreThanFourSeats,
      userId: userId,
      carBrand: carBrand,
      originalCarBrand: originalCarBrand?.toEntity(),
      rate: rate,
      orderCount: orderCount,
      image: image.map((e) => e.toEntity()).toList(),
      ownershipDocument: ownershipDocument.map((e) => e.toEntity()).toList(),
    );
  }

  static VehicleModel fromEntity(Vehicle entity) {
    return VehicleModel(
      id: entity.id,
      modelYear: entity.modelYear,
      licensePlate: entity.licensePlate,
      gearType: entity.gearType,
      isModified: entity.isModified,
      originalCarBrandId: entity.originalCarBrandId,
      carBrandId: entity.carBrandId,
      moreThanFourSeats: entity.moreThanFourSeats,
      userId: entity.userId,
      carBrand: entity.carBrand,
      originalCarBrand: entity.originalCarBrand != null
          ? OriginalCarBrandModel.fromEntity(entity.originalCarBrand!)
          : null,
      rate: entity.rate,
      orderCount: entity.orderCount,
      image: entity.image.map(VehicleImageModel.fromEntity).toList(),
      ownershipDocument: entity.ownershipDocument
          .map(OwnershipDocumentModel.fromEntity)
          .toList(),
    );
  }
}

//____submodels: ____________________________________________________________________
class OriginalCarBrandModel {
  final int id;
  final String name;

  const OriginalCarBrandModel({required this.id, required this.name});

  factory OriginalCarBrandModel.fromJson(Map<String, dynamic> json) {
    return OriginalCarBrandModel(
      id: json['id'],
      name: json['name'],
    );
  }

  OriginalCarBrand toEntity() => OriginalCarBrand(id: id, name: name);

  static OriginalCarBrandModel fromEntity(OriginalCarBrand entity) =>
      OriginalCarBrandModel(id: entity.id, name: entity.name);
}

class VehicleImageModel {
  final int id;
  final String path;

  const VehicleImageModel({required this.id, required this.path});

  factory VehicleImageModel.fromJson(Map<String, dynamic> json) {
    return VehicleImageModel(
      id: json['id'],
      path: json['path'],
    );
  }

  VehicleImage toEntity() => VehicleImage(id: id, path: path);

  static VehicleImageModel fromEntity(VehicleImage entity) =>
      VehicleImageModel(id: entity.id, path: entity.path);
}

class OwnershipDocumentModel {
  final int id;
  final String face1;
  final String face2;

  const OwnershipDocumentModel({
    required this.id,
    required this.face1,
    required this.face2,
  });

  factory OwnershipDocumentModel.fromJson(Map<String, dynamic> json) {
    return OwnershipDocumentModel(
      id: json['id'],
      face1: json['face_1'],
      face2: json['face_2'],
    );
  }

  OwnershipDocument toEntity() =>
      OwnershipDocument(id: id, face1: face1, face2: face2);

  static OwnershipDocumentModel fromEntity(OwnershipDocument entity) =>
      OwnershipDocumentModel(
          id: entity.id, face1: entity.face1, face2: entity.face2);
}
