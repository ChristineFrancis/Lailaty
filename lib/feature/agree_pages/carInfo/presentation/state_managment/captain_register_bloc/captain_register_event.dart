import 'package:equatable/equatable.dart';
import 'package:lailaty/feature/agree_pages/carInfo/domain/entities/captain_registration_documents_request.dart';

abstract class CaptainRegisterEvent extends Equatable {
  const CaptainRegisterEvent();

  @override
  List<Object?> get props => [];
}

class SubmitCaptainRegistration extends CaptainRegisterEvent {
  final CaptainRegistrationDocumentsRequest request;

  const SubmitCaptainRegistration(this.request);

  @override
  List<Object?> get props => [request];
}
