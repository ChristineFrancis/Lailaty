import 'package:lailaty/feature/agree_pages/carInfo/domain/entities/brands_car_entity.dart';

// class CarBrandModel extends BrandsCarEntity {
//   CarBrandModel({required super.name, required super.id});
//   factory CarBrandModel.fromjson(Map<String, dynamic> json) {
//     return CarBrandModel(name: json["name"], id: json["id"]);
//   }
//   Map<String, dynamic> tojson() {
//     return {"name": name, "id": id};
//   }
// }
class BrandsCarModel {
  final int id;
  final String name;

  const BrandsCarModel({
    required this.id,
    required this.name,
  });

  /// Convert from JSON to Model
  factory BrandsCarModel.fromJson(Map<String, dynamic> json) {
    return BrandsCarModel(
      id: json['id'],
      name: json['name'],
    );
  }

  /// Convert Model to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }

  /// Convert Model to Entity
  BrandsCarEntity toEntity() {
    return BrandsCarEntity(
      id: id,
      name: name,
    );
  }

  /// Convert Entity to Model
  static BrandsCarModel fromEntity(BrandsCarEntity entity) {
    return BrandsCarModel(
      id: entity.id,
      name: entity.name,
    );
  }
}
