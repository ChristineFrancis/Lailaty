import 'package:equatable/equatable.dart';

class VerifyEmailResponse extends Equatable {
  final String message;
  final String accessToken;
  final String refreshToken;
  final Map<String, dynamic> user;

  const VerifyEmailResponse({
    required this.message,
    required this.accessToken,
    required this.refreshToken,
    required this.user,
  });

  @override
  List<Object> get props => [message, accessToken, refreshToken, user];
}
