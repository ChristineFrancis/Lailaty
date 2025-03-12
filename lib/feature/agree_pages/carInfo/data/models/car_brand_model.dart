import 'package:lailaty/feature/agree_pages/carInfo/domain/entities/brands_car_entity.dart';

class CarBrandModel extends BrandsCarEntity {
  CarBrandModel({required super.name, required super.id});
  factory CarBrandModel.fromjson(Map<String, dynamic> json) {
    return CarBrandModel(name: json["name"], id: json["id"]);
  }
  Map<String, dynamic> tojson() {
    return {"name": name, "id": id};
  }
}
