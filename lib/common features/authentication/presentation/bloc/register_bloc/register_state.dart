import 'package:equatable/equatable.dart';
import '../../../domain/entities/auth_response.dart';

abstract class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object> get props => [];
}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterLoaded extends RegisterState {
  final AuthResponse authResponse;

  const RegisterLoaded({required this.authResponse});

  @override
  List<Object> get props => [authResponse];
}

class RegisterError extends RegisterState {
  final String message;

  const RegisterError({required this.message});

  @override
  List<Object> get props => [message];
}
