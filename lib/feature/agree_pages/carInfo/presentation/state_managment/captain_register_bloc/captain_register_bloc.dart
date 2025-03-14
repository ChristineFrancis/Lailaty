import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:lailaty/core/error_manager/failures.dart';
import 'package:lailaty/core/resources/string_manager.dart';
import 'package:lailaty/feature/agree_pages/carInfo/domain/entities/captain_registration_documents_response_message.dart';
import 'package:lailaty/feature/agree_pages/carInfo/domain/use_case/captain_registration_usecase.dart';
import 'package:lailaty/feature/agree_pages/carInfo/presentation/state_managment/captain_register_bloc/captain_register_event.dart';
import 'package:lailaty/feature/agree_pages/carInfo/presentation/state_managment/captain_register_bloc/captain_register_state.dart';

class CaptainRegisterBloc
    extends Bloc<CaptainRegisterEvent, CaptainRegisterState> {
  final CaptainRegistrationUsecase captainRegisterUseCase;

  CaptainRegisterBloc({required this.captainRegisterUseCase})
      : super(CaptainRegisterInitial()) {
    on<SubmitCaptainRegistration>((event, emit) async {
      emit(CaptainRegisterLoading());

      final Either<Failure, CaptainRegistrationDocumentsResponseMessage>
          result = await captainRegisterUseCase(event.request);
      result.fold((failure) {
        emit(CaptainRegisterFailure(_mapFailureToMessage(failure)));
      }, (response) {
        emit(CaptainRegisterSuccess(response.message));
      });
    });
  }

  String _mapFailureToMessage(Failure failure) {
    if (failure is ServerFailure) {
      return failure.message;
    } else if (failure is NoConnectionFailure) {
      return StringManager.noInternetConnection;
    } else {
      return failure.message;
    }
  }
}
