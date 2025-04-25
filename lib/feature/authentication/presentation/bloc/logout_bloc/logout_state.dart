import 'package:equatable/equatable.dart';

import '../../../domain/entities/logout_response.dart';

abstract class LogoutState extends Equatable {
  const LogoutState();

  @override
  List<Object> get props => [];
}

class LogoutInitial extends LogoutState {}

class LogoutLoading extends LogoutState {}

class LogoutLoaded extends LogoutState {
  final LogoutResponse response;
  const LogoutLoaded({required this.response});

  @override
  List<Object> get props => [response];
}

class LogoutError extends LogoutState {
  final String message;
  const LogoutError({required this.message});

  @override
  List<Object> get props => [message];
}
