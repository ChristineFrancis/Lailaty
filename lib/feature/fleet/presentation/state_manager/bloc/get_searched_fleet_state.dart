part of 'get_searched_fleet_bloc.dart';

@immutable
abstract class GetSearchedFleetState extends Equatable {
  const GetSearchedFleetState();

  @override
  List<Object?> get props => [];
}

final class GetSearchedFleetInitial extends GetSearchedFleetState {}

class GetSearchedFleetLoading extends GetSearchedFleetState {}

class GetSearchedFleetSuccess extends GetSearchedFleetState {
  final List<GetAllFleetEntity> getAllFleetEntity;
  const GetSearchedFleetSuccess({
    required this.getAllFleetEntity,
  });

  @override
  List<Object?> get props => [getAllFleetEntity];
}

class GetSearchedFleetFailure extends GetSearchedFleetState {
  final String errorMessage;

  const GetSearchedFleetFailure(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}

class GetSearchedFleetOffline extends GetSearchedFleetState {
  final String errorMessage;

  const GetSearchedFleetOffline(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
