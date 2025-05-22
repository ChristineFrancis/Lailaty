part of 'add_veicle_bloc.dart';

abstract class AddVeicleState extends Equatable {
  const AddVeicleState();

  @override
  List<Object?> get props => [];
}

class AddVeicleInitial extends AddVeicleState {}

class AddVeicleLoading extends AddVeicleState {}

class AddVeicleSuccess extends AddVeicleState {
  final String message;

  const AddVeicleSuccess(this.message);

  @override
  List<Object?> get props => [message];
}

class AddVeicleFailure extends AddVeicleState {
  final String message;

  const AddVeicleFailure(this.message);

  @override
  List<Object?> get props => [message];
}
