import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:lailaty/core/error_manager/failures.dart';
import '../../../domain/entities/verify_email_request.dart';
import '../../../domain/entities/verify_email_response.dart';
import '../../../domain/entities/resend_verification_request.dart';
import '../../../domain/use_cases/verify_email.dart';
import '../../../domain/use_cases/resend_verification_code.dart';
import 'verify_email_event.dart';
import 'verify_email_state.dart';

class VerifyEmailBloc extends Bloc<VerifyEmailEvent, VerifyEmailState> {
  final VerifyEmail verifyEmailUseCase;
  final ResendVerificationCode resendVerificationCodeUseCase;

  VerifyEmailBloc({
    required this.verifyEmailUseCase,
    required this.resendVerificationCodeUseCase,
  }) : super(VerifyEmailInitial()) {
    on<VerifyEmailSubmitted>(_onVerifyEmailSubmitted);
    on<ResendVerificationCodeSubmitted>(_onResendVerificationCodeSubmitted);
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
      (failure) => emit(VerifyEmailError(message: failure.message)),
      (response) => emit(VerifyEmailLoaded(verifyEmailResponse: response)),
    );
  }

  Future<void> _onResendVerificationCodeSubmitted(
      ResendVerificationCodeSubmitted event,
      Emitter<VerifyEmailState> emit) async {
    emit(VerifyEmailLoading());
    final Either<Failure, dynamic> failureOrResponse =
        await resendVerificationCodeUseCase(
            ResendVerificationRequest(email: event.email));
    failureOrResponse.fold(
      (failure) => emit(VerifyEmailError(message: failure.message)),
      (response) => emit(VerifyEmailResendSuccess(message: response.message)),
    );
  }
}
