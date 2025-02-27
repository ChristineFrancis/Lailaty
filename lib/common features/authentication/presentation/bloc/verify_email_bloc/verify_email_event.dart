import 'package:equatable/equatable.dart';

abstract class VerifyEmailEvent extends Equatable {
  const VerifyEmailEvent();

  @override
  List<Object> get props => [];
}

class VerifyEmailSubmitted extends VerifyEmailEvent {
  final String email;
  final String verificationCode;

  const VerifyEmailSubmitted({
    required this.email,
    required this.verificationCode,
  });

  @override
  List<Object> get props => [email, verificationCode];
}
