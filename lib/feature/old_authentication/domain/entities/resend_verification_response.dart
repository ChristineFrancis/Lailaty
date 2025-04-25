import 'package:equatable/equatable.dart';

class ResendVerificationResponse extends Equatable {
  final String message;

  const ResendVerificationResponse({required this.message});

  @override
  List<Object> get props => [message];
}
