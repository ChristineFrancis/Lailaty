// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'fleet_company_bloc.dart';

abstract class FleetCompanyState extends Equatable {
  const FleetCompanyState();

  @override
  List<Object?> get props => [];
}

final class FleetCompanyInitial extends FleetCompanyState {}

class FleetCompanyLoading extends FleetCompanyState {}

class FleetCompanySuccess extends FleetCompanyState {
  final FleetCreateCompanyResponseEntity fleetCreateCompanyResponseEntity;
  const FleetCompanySuccess({
    required this.fleetCreateCompanyResponseEntity,
  });

  @override
  List<Object?> get props => [fleetCreateCompanyResponseEntity];
}

class FleetCompanyFailure extends FleetCompanyState {
  final String errorMessage;

  const FleetCompanyFailure(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}

class FleetCompanyOffline extends FleetCompanyState {
  final String errorMessage;

  const FleetCompanyOffline(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
