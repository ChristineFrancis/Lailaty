import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import '../../../../../core/error_manager/failures.dart';
import '../../../domain/entities/forgot_password_request.dart';
import '../../../domain/entities/forgot_password_response.dart';
import '../../../domain/use_cases/forgot_password.dart';
import 'forgot_password_event.dart';
import 'forgot_password_state.dart';

class ForgotPasswordBloc extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  final ForgotPassword forgotPasswordUseCase;
  ForgotPasswordBloc({required this.forgotPasswordUseCase}) : super(ForgotPasswordInitial()) {
    on<ForgotPasswordSubmitted>(_onForgotPasswordSubmitted);
  }

  Future<void> _onForgotPasswordSubmitted(ForgotPasswordSubmitted event, Emitter<ForgotPasswordState> emit) async {
    emit(ForgotPasswordLoading());
    final request = ForgotPasswordRequest(email: event.email);
    final Either<Failure, ForgotPasswordResponse> failureOrResponse = await forgotPasswordUseCase(request);
    failureOrResponse.fold(
      (failure) => emit(ForgotPasswordError(message: failure.message)),
      (response) => emit(ForgotPasswordLoaded(response: response)),
    );
  }
}
