import 'package:equatable/equatable.dart';

class VehicleRegistrationResponse extends Equatable {
  final Vehicle vehicle;

  const VehicleRegistrationResponse({required this.vehicle});

  factory VehicleRegistrationResponse.fromJson(Map<String, dynamic> json) {
    return VehicleRegistrationResponse(
      vehicle: Vehicle.fromJson(json['vehicle']),
    );
  }

  @override
  List<Object?> get props => [vehicle];
}

class Vehicle extends Equatable {
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
  final OriginalCarBrand? originalCarBrand;
  final int rate;
  final int? orderCount;
  final List<VehicleImage> image;
  final List<OwnershipDocument> ownershipDocument;

  const Vehicle({
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

  factory Vehicle.fromJson(Map<String, dynamic> json) {
    return Vehicle(
      id: json['id'],
      modelYear: json['model_year'],
      licensePlate: json['license_plate'],
      gearType: json['gear_type'],
      isModified: json['is_modified'] == "1" || json['is_modified'] == 1,
      originalCarBrandId: json['original_car_brand_id']?.toString(),
      carBrandId: json['car_brand_id'] != null
          ? int.tryParse(json['car_brand_id'].toString())
          : null,
      moreThanFourSeats: json['more_than_four_seats'] == "1" || json['more_than_four_seats'] == 1,
      userId: json['user_id'],
      carBrand: json['car_brand'],
      originalCarBrand: json['original_car_brand'] != null
          ? OriginalCarBrand.fromJson(json['original_car_brand'])
          : null,
      rate: json['rate'] ?? 0,
      orderCount: json['order_count'],
      image: (json['image'] as List<dynamic>?)
              ?.map((e) => VehicleImage.fromJson(e))
              .toList() ??
          [],
      ownershipDocument: (json['ownership_document'] as List<dynamic>?)
              ?.map((e) => OwnershipDocument.fromJson(e))
              .toList() ??
          [],
    );
  }

  @override
  List<Object?> get props => [
        id,
        modelYear,
        licensePlate,
        gearType,
        isModified,
        originalCarBrandId,
        carBrandId,
        moreThanFourSeats,
        userId,
        carBrand,
        originalCarBrand,
        rate,
        orderCount,
        image,
        ownershipDocument,
      ];
}


class OriginalCarBrand extends Equatable {
  final int id;
  final String name;

  const OriginalCarBrand({required this.id, required this.name});

  factory OriginalCarBrand.fromJson(Map<String, dynamic> json) {
    return OriginalCarBrand(
      id: json['id'],
      name: json['name'],
    );
  }

  @override
  List<Object?> get props => [id, name];
}

class VehicleImage extends Equatable {
  final int id;
  final String path;

  const VehicleImage({
    required this.id,
    required this.path,
  });

  factory VehicleImage.fromJson(Map<String, dynamic> json) {
    return VehicleImage(
      id: json['id'],
      path: json['path'],
    );
  }

  @override
  List<Object?> get props => [id, path];
}

class OwnershipDocument extends Equatable {
  final int id;
  final String face1;
  final String face2;

  const OwnershipDocument({
    required this.id,
    required this.face1,
    required this.face2,
  });

  factory OwnershipDocument.fromJson(Map<String, dynamic> json) {
    return OwnershipDocument(
      id: json['id'],
      face1: json['face_1'],
      face2: json['face_2'],
    );
  }

  @override
  List<Object?> get props => [id, face1, face2];
}
