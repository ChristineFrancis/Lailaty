import 'package:equatable/equatable.dart';

class ForgotPasswordResponse extends Equatable {
  final String message;

  const ForgotPasswordResponse({required this.message});

  @override
  List<Object> get props => [message];
}
