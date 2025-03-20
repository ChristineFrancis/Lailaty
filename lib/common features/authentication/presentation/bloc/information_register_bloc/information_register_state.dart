import 'package:equatable/equatable.dart';
import 'package:lailaty/common%20features/authentication/data/models/user_model.dart';

abstract class InformationRegisterState extends Equatable {
  const InformationRegisterState();

  @override
  List<Object> get props => [];
}

class InformationRegisterInitial extends InformationRegisterState {}

class InformationRegisterLoading extends InformationRegisterState {}

class InformationRegisterLoaded extends InformationRegisterState {
  final UserModel user;
  const InformationRegisterLoaded({required this.user});

  @override
  List<Object> get props => [user];
}

class InformationRegisterError extends InformationRegisterState {
  final String message;
  const InformationRegisterError({required this.message});

  @override
  List<Object> get props => [message];
}
