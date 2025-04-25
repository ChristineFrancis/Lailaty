import 'package:equatable/equatable.dart';

class LogoutRequest extends Equatable {
  final String token;

  const LogoutRequest({required this.token});

  @override
  List<Object> get props => [token];
}
