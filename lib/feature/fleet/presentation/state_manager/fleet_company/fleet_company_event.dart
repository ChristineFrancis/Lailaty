part of 'fleet_company_bloc.dart';

abstract class FleetCompanyEvent extends Equatable {
  const FleetCompanyEvent();

  @override
  List<Object?> get props => [];
}

class SubmitFleetCompany extends FleetCompanyEvent {
  final FleetCreateCompanyRequestEntity request;

  const SubmitFleetCompany(this.request);

  @override
  List<Object?> get props => [request];
}
