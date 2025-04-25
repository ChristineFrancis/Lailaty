// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'get_searched_fleet_bloc.dart';

@immutable
sealed class GetSearchedFleetEvent {}

class RequestForSearchFleet extends GetSearchedFleetEvent {
  final String parameter;
  RequestForSearchFleet({
    required this.parameter,
  });
}
