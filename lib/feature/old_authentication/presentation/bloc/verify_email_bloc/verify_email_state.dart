import 'package:equatable/equatable.dart';

import '../../../domain/entities/verify_email_response.dart';

abstract class VerifyEmailState extends Equatable {
  const VerifyEmailState();

  @override
  List<Object> get props => [];
}

class VerifyEmailInitial extends VerifyEmailState {}

class VerifyEmailLoading extends VerifyEmailState {}

class VerifyEmailLoaded extends VerifyEmailState {
  final VerifyEmailResponse verifyEmailResponse;

  const VerifyEmailLoaded({required this.verifyEmailResponse});

  @override
  List<Object> get props => [verifyEmailResponse];
}

class VerifyEmailError extends VerifyEmailState {
  final String message;

  const VerifyEmailError({required this.message});

  @override
  List<Object> get props => [message];
}

class VerifyEmailResendSuccess extends VerifyEmailState {
  final String message;

  const VerifyEmailResendSuccess({required this.message});

  @override
  List<Object> get props => [message];
}
