import 'package:equatable/equatable.dart';

import '../../../domain/entities/login_response.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginLoaded extends LoginState {
  final LoginResponse loginResponse;
  const LoginLoaded({required this.loginResponse});

  @override
  List<Object> get props => [loginResponse];
}

class LoginError extends LoginState {
  final String message;
  const LoginError({required this.message});

  @override
  List<Object> get props => [message];
}
