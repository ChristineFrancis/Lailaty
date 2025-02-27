import 'package:equatable/equatable.dart';

class RegistrationErrors extends Equatable {
  final String message;
  final Map<String, List<String>> errors;

  const RegistrationErrors({required this.message, required this.errors});

  @override
  List<Object?> get props => [message, errors];
}
