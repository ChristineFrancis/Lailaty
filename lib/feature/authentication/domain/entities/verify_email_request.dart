import 'package:equatable/equatable.dart';

class VerifyEmailRequest extends Equatable {
  final String email;
  final String verificationCode;

  const VerifyEmailRequest({
    required this.email,
    required this.verificationCode,
  });

  @override
  List<Object> get props => [email, verificationCode];
}
