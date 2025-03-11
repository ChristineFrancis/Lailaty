import 'package:equatable/equatable.dart';

class LogoutResponse extends Equatable {
  final String message;

  const LogoutResponse({required this.message});

  @override
  List<Object> get props => [message];
}
