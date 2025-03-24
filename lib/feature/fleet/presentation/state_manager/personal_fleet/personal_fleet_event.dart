part of 'personal_fleet_bloc.dart';

abstract class PersonalFleetEvent extends Equatable {
  const PersonalFleetEvent();

  @override
  List<Object?> get props => [];
}

class SubmitPersonalFleet extends PersonalFleetEvent {
  final FleetCreatePersonRequest request;

  const SubmitPersonalFleet(this.request);

  @override
  List<Object?> get props => [request];
}
