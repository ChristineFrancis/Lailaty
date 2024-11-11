import 'package:equatable/equatable.dart';

class VerificationCode extends Equatable {
  final String verificationCode;
  const VerificationCode({required this.verificationCode});

  @override
  List<Object?> get props => [verificationCode];
}
