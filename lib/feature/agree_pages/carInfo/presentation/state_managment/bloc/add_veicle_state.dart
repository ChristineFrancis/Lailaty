part of 'add_veicle_bloc.dart';

sealed class AddVeicleState extends Equatable {
  const AddVeicleState();
  
  @override
  List<Object> get props => [];
}

final class AddVeicleInitial extends AddVeicleState {}
