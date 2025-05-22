part of 'create_work_request_bloc.dart';

@immutable
sealed class CreateWorkRequestEvent extends Equatable {
  const CreateWorkRequestEvent();

  @override
  List<Object?> get props => [];
}

class SubmitWorkRequest extends CreateWorkRequestEvent {
  final int officeId;

  const SubmitWorkRequest(this.officeId);

  @override
  List<Object?> get props => [officeId];
}
