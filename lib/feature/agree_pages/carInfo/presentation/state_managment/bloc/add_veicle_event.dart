part of 'add_veicle_bloc.dart';

sealed class AddVeicleEvent extends Equatable {
  const AddVeicleEvent();

  @override
  List<Object> get props => [];
}

class AddCarEvent extends AddVeicleEvent {
  final String typeViecle;
  final CarViecleEntity carViecleEntity;

  AddCarEvent({required this.typeViecle,required this.carViecleEntity});
}

class AddMotorEvent extends AddVeicleEvent {
  final String typeVeicle;

  final MotorInfoBaseEntity motorInfoBaseEntity;
  AddMotorEvent({required this.typeVeicle,required this.motorInfoBaseEntity});
}

class GetBrandCarEvent extends AddVeicleEvent {}
