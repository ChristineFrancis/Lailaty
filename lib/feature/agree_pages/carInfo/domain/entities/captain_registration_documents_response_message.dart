import 'package:equatable/equatable.dart';

class CaptainRegistrationDocumentsResponseMessage extends Equatable {
  final String message;

  const CaptainRegistrationDocumentsResponseMessage({required this.message});

  @override
  List<Object> get props => [message];
}
// make sure ?