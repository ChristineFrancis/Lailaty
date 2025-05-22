part of 'create_work_request_bloc.dart';

@immutable
sealed class CreateWorkRequestState extends Equatable {
  const CreateWorkRequestState();

  @override
  List<Object?> get props => [];
}

final class CreateWorkRequestInitial extends CreateWorkRequestState {}

class CreateWorkRequestLoading extends CreateWorkRequestState {}

class CreateWorkRequestSuccess extends CreateWorkRequestState {
  final CreateWorkRequestEntity createWorkRequestEntity;

  const CreateWorkRequestSuccess(this.createWorkRequestEntity);

  @override
  List<Object?> get props => [createWorkRequestEntity];
}

class CreateWorkRequestFailure extends CreateWorkRequestState {
  final String errorMessage;

  const CreateWorkRequestFailure(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
