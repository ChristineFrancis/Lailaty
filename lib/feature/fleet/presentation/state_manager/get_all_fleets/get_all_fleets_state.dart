part of 'get_all_fleets_bloc.dart';

// @immutable
// sealed class GetAllFleetsState {}

// final class GetAllFleetsInitial extends GetAllFleetsState {}

abstract class GetAllFleetsState extends Equatable {
  const GetAllFleetsState();

  @override
  List<Object?> get props => [];
}

final class GetAllFleetsInitial extends GetAllFleetsState {}

class GetAllFleetsLoading extends GetAllFleetsState {}

class GetAllFleetsSuccess extends GetAllFleetsState {
  final List<GetAllFleetEntity> getAllFleetEntity;
  const GetAllFleetsSuccess({
    required this.getAllFleetEntity,
  });

  @override
  List<Object?> get props => [getAllFleetEntity];
}

class GetAllFleetsFailure extends GetAllFleetsState {
  final String errorMessage;

  const GetAllFleetsFailure(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}

class GetAllFleetsOffline extends GetAllFleetsState {
  final String errorMessage;

  const GetAllFleetsOffline(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
