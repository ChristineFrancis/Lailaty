import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:lailaty/core/error_manager/exception.dart';
import 'package:lailaty/core/resources/url_manager.dart';

import 'package:lailaty/feature/agree_pages/carInfo/data/models/car_brand_model.dart';
import 'package:lailaty/feature/agree_pages/carInfo/data/models/car_info_model.dart';
import 'package:lailaty/feature/agree_pages/carInfo/data/models/motor_info_model.dart';

abstract class AgreePagesRemoteDateSource {
  Future<List<CarBrandModel>> getBrandsCar();
  Future<Unit> addCar(CarInfoModel car, String param);
  Future<Unit> addMotor(MotorInfoModel motor, String param);
}

class AgreePagesRemoteDateSourceImpl implements AgreePagesRemoteDateSource {
  final http.Client client;
  AgreePagesRemoteDateSourceImpl({
    required this.client,
  });
  @override
  Future<Unit> addCar(CarInfoModel car, String param) async {
    final url = Uri.parse("${UrlManager.addVeicleUrl}/$param");
    final response = await client.post(
      url,
      body: car.toJson(),
      headers: getHeader(true),
    );
    if (response.statusCode == 201) {
      final res = json.decode(response.body);
      return res;
    } else {

  throw const ServerException('Failed to register email');
    }
  }

  @override
  Future<Unit> addMotor(MotorInfoModel motor, String param) {
    // TODO: implement addMotor
    throw UnimplementedError();
  }

  @override
  Future<List<CarBrandModel>> getBrandsCar() {
    // TODO: implement getBrandsCar
    throw UnimplementedError();
  }
}

Map<String, String>? getHeader(bool hasToken) {
  if (hasToken == false) {
    return {
      'Accept': 'application/json',
    };
  } else {
    return {
      'Accept': 'application/json',
      "Token": "75|SiCLDtSw2dCSFFqHWyWW1Z0EeWWmlte7q5L0yiwK63a49bad"
    };
  }
}
