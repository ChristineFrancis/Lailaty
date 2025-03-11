import 'package:equatable/equatable.dart';

class ResendVerificationRequest extends Equatable {
  final String email;

  const ResendVerificationRequest({required this.email});

  @override
  List<Object> get props => [email];
}
