import 'package:equatable/equatable.dart';

abstract class CaptainRegisterState extends Equatable {
  const CaptainRegisterState();

  @override
  List<Object?> get props => [];
}

//initial:
class CaptainRegisterInitial extends CaptainRegisterState {}

//loading:
class CaptainRegisterLoading extends CaptainRegisterState {}

//success:
class CaptainRegisterSuccess extends CaptainRegisterState {
  final String message;

  const CaptainRegisterSuccess(this.message);

  @override
  List<Object?> get props => [message];
}

//error :
class CaptainRegisterFailure extends CaptainRegisterState {
  final String errorMessage;

  const CaptainRegisterFailure(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}

class CaptainRegisterOffline extends CaptainRegisterState {
  final String errorMessage;

  const CaptainRegisterOffline(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
