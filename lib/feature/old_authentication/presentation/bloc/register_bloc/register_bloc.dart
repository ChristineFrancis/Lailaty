import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import '../../../../../core/error_manager/failures.dart';
import '../../../domain/entities/auth_request.dart';
import '../../../domain/entities/auth_response.dart';
import '../../../domain/use_cases/register.dart';
import 'register_event.dart';
import 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final Register registerUseCase;

  RegisterBloc({required this.registerUseCase}) : super(RegisterInitial()) {
    on<RegisterWithEmailEvent>(_onRegisterWithEmail);
  }

  Future<void> _onRegisterWithEmail(
      RegisterWithEmailEvent event, Emitter<RegisterState> emit) async {
    emit(RegisterLoading());
    // Create the auth request entity using the provided email and password.
    final authRequest = AuthRequest(email: event.email, password: event.password);

    final Either<Failure, AuthResponse> failureOrResponse =
        await registerUseCase(authRequest);
    failureOrResponse.fold(
      (failure) => emit(RegisterError(message: _mapFailureToMessage(failure))),
      (authResponse) => emit(RegisterLoaded(authResponse: authResponse)),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    // Customize this mapping as needed.
    return failure.message;
  }
}
