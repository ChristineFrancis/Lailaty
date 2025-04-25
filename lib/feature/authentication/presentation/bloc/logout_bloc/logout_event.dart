import 'package:equatable/equatable.dart';

abstract class LogoutEvent extends Equatable {
  const LogoutEvent();

  @override
  List<Object> get props => [];
}

class LogoutSubmitted extends LogoutEvent {
  final String token;
  const LogoutSubmitted({required this.token});

  @override
  List<Object> get props => [token];
}
