import 'package:equatable/equatable.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();
  
  @override
  List<Object> get props => [];
}

class RegisterWithEmailEvent extends RegisterEvent {
  final String email;
  final String password;

  const RegisterWithEmailEvent({
    required this.email,
    required this.password,
  });

  @override
  List<Object> get props => [email, password];
}
