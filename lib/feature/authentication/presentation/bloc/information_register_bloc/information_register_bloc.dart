import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lailaty/core/error_manager/failures.dart';
import 'package:lailaty/feature/authentication/data/models/user_model.dart';

import '../../../domain/use_cases/information_register.dart';
import 'information_register_event.dart';
import 'information_register_state.dart';

class InformationRegisterBloc
    extends Bloc<InformationRegisterEvent, InformationRegisterState> {
  final InformationRegister informationRegisterUseCase;
  InformationRegisterBloc({required this.informationRegisterUseCase})
      : super(InformationRegisterInitial()) {
    on<InformationRegisterSubmitted>(_onInformationRegisterSubmitted);
  }

  Future<void> _onInformationRegisterSubmitted(
      InformationRegisterSubmitted event,
      Emitter<InformationRegisterState> emit) async {
    emit(InformationRegisterLoading());
    final Either<Failure, UserModel> result =
        await informationRegisterUseCase(event.request);
    result.fold(
      (failure) => emit(InformationRegisterError(message: failure.message)),
      (user) => emit(InformationRegisterLoaded(user: user)),
    );
  }
}
