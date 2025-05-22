part of 'add_veicle_bloc.dart';

sealed class AddVeicleEvent extends Equatable {
  const AddVeicleEvent();

  @override
  List<Object> get props => [];
}

class AddCarEvent extends AddVeicleEvent {
  final String typeViecle;
  final CarRegistrationRequest carViecleEntity;

  AddCarEvent({required this.typeViecle, required this.carViecleEntity});
}

class AddMotorEvent extends AddVeicleEvent {
  final String typeVeicle;

  final MotorcycleRegistrationRequest motorInfoBaseEntity;
  AddMotorEvent({required this.typeVeicle, required this.motorInfoBaseEntity});
}

