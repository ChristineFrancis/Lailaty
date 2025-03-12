import 'package:equatable/equatable.dart';

import '../../../domain/entities/forgot_password_response.dart';

abstract class ForgotPasswordState extends Equatable {
  const ForgotPasswordState();

  @override
  List<Object> get props => [];
}

class ForgotPasswordInitial extends ForgotPasswordState {}

class ForgotPasswordLoading extends ForgotPasswordState {}

class ForgotPasswordLoaded extends ForgotPasswordState {
  final ForgotPasswordResponse response;
  const ForgotPasswordLoaded({required this.response});

  @override
  List<Object> get props => [response];
}

class ForgotPasswordError extends ForgotPasswordState {
  final String message;
  const ForgotPasswordError({required this.message});

  @override
  List<Object> get props => [message];
}
