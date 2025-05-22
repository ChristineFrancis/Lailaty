import 'dart:io';
import 'package:equatable/equatable.dart';

class MotorcycleRegistrationRequest extends Equatable {
  final String modelYear;
  final String licensePlate;
  final File image1;
  final File face1;
  final File face2;

  const MotorcycleRegistrationRequest({
    required this.modelYear,
    required this.licensePlate,
    required this.image1,
    required this.face1,
    required this.face2,
  });

  @override
  List<Object?> get props => [
        modelYear,
        licensePlate,
        image1,
        face1,
        face2,
      ];
}
