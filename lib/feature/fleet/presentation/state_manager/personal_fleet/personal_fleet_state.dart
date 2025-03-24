part of 'personal_fleet_bloc.dart';

// @immutable
// sealed class PersonalFleetState {}

// final class PersonalFleetInitial extends PersonalFleetState {}

abstract class PersonalFleetState extends Equatable {
  const PersonalFleetState();

  @override
  List<Object?> get props => [];
}

final class PersonalFleetInitial extends PersonalFleetState {}

class PersonalFleetLoading extends PersonalFleetState {}

class PersonalFleetSuccess extends PersonalFleetState {
  final FleetCreatePersonalResponse fleetCreatePersonalResponse;
  const PersonalFleetSuccess({
    required this.fleetCreatePersonalResponse,
  });

  @override
  List<Object?> get props => [fleetCreatePersonalResponse];
}

class PersonalFleetFailure extends PersonalFleetState {
  final String errorMessage;

  const PersonalFleetFailure(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}

class PersonalFleetOffline extends PersonalFleetState {
  final String errorMessage;

  const PersonalFleetOffline(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
