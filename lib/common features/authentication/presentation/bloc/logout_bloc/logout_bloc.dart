import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lailaty/common%20features/authentication/domain/use_cases/logout.dart';
import '../../../../../core/error_manager/failures.dart';
import '../../../domain/entities/logout_request.dart';
import '../../../domain/entities/logout_response.dart';
import 'logout_event.dart';
import 'logout_state.dart';

class LogoutBloc extends Bloc<LogoutEvent, LogoutState> {
  final Logout logoutUseCase;

  LogoutBloc({required this.logoutUseCase}) : super(LogoutInitial()) {
    on<LogoutSubmitted>(_onLogoutSubmitted);
  }

  Future<void> _onLogoutSubmitted(
      LogoutSubmitted event, Emitter<LogoutState> emit) async {
    emit(LogoutLoading());
    final request = LogoutRequest(token: event.token);
    final Either<Failure, LogoutResponse> failureOrResponse =
        await logoutUseCase(request);
    failureOrResponse.fold(
      (failure) => emit(LogoutError(message: failure.message)),
      (response) => emit(LogoutLoaded(response: response)),
    );
  }
}
