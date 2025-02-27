import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import '../../../../../core/error_manager/failures.dart';
import '../../../domain/entities/verify_email_request.dart';
import '../../../domain/entities/verify_email_response.dart';
import '../../../domain/use_cases/verify_email.dart';
import 'verify_email_event.dart';
import 'verify_email_state.dart';

class VerifyEmailBloc extends Bloc<VerifyEmailEvent, VerifyEmailState> {
  final VerifyEmail verifyEmailUseCase;

  VerifyEmailBloc({required this.verifyEmailUseCase})
      : super(VerifyEmailInitial()) {
    on<VerifyEmailSubmitted>(_onVerifyEmailSubmitted);
  }

  Future<void> _onVerifyEmailSubmitted(
      VerifyEmailSubmitted event, Emitter<VerifyEmailState> emit) async {
    emit(VerifyEmailLoading());
    final request = VerifyEmailRequest(
      email: event.email,
      verificationCode: event.verificationCode,
    );
    final Either<Failure, VerifyEmailResponse> failureOrResponse =
        await verifyEmailUseCase(request);
    failureOrResponse.fold(
      (failure) =>
          emit(VerifyEmailError(message: failure.message)),
      (response) => emit(VerifyEmailLoaded(verifyEmailResponse: response)),
    );
  }
}
