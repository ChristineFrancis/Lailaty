import 'package:equatable/equatable.dart';
import 'package:lailaty/common%20features/authentication/domain/entities/info_register_request.dart';

abstract class InformationRegisterEvent extends Equatable {
  const InformationRegisterEvent();

  @override
  List<Object> get props => [];
}

class InformationRegisterSubmitted extends InformationRegisterEvent {
  final InfoRegisterRequest request;
  const InformationRegisterSubmitted({required this.request});

  @override
  List<Object> get props => [request];
}


