import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:lailaty/core/error_manager/failures.dart';
import '../../../domain/entities/login_request.dart';
import '../../../domain/entities/login_response.dart';
import '../../../domain/use_cases/login.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final Login loginUseCase;

  LoginBloc({required this.loginUseCase}) : super(LoginInitial()) {
    on<LoginSubmitted>(_onLoginSubmitted);
  }

  Future<void> _onLoginSubmitted(
      LoginSubmitted event, Emitter<LoginState> emit) async {
    emit(LoginLoading());
    final request = LoginRequest(email: event.email, password: event.password);
    final Either<Failure, LoginResponse> failureOrResponse =
        await loginUseCase(request);
    failureOrResponse.fold(
      (failure) => emit(LoginError(message: failure.message)),
      (response) => emit(LoginLoaded(loginResponse: response)),
    );
  }
}
