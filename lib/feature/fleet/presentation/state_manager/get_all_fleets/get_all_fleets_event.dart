part of 'get_all_fleets_bloc.dart';

@immutable
sealed class GetAllFleetsEvent {}


class RequestAllFleets extends GetAllFleetsEvent{}

