part of 'add_veicle_bloc.dart';

sealed class AddVeicleState extends Equatable {
  const AddVeicleState();

  @override
  List<Object> get props => [];
}

final class AddVeicleInitial extends AddVeicleState {}

class SuccessAddedState extends AddVeicleState {
    final String message;

  SuccessAddedState({required this.message});
}

class LoadingAddedState extends AddVeicleState {}

class OfflineAddedVeicleState extends AddVeicleState {}

class FailedAddedVeicleState extends AddVeicleState {
  final String message;

  FailedAddedVeicleState({required this.message});
}
