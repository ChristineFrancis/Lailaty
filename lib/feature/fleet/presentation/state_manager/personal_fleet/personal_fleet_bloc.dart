// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:lailaty/core/error_manager/failures.dart';
import 'package:lailaty/core/resources/string_manager.dart';
import 'package:lailaty/feature/fleet/domain/entities/personal_fleet/fleet_create_person_request.dart';
import 'package:lailaty/feature/fleet/domain/entities/personal_fleet/fleet_create_person_response.dart';
import 'package:lailaty/feature/fleet/domain/usecases/create_personal_fleet_usecase.dart';

part 'personal_fleet_event.dart';
part 'personal_fleet_state.dart';

class PersonalFleetBloc extends Bloc<PersonalFleetEvent, PersonalFleetState> {
  final CreatePersonalFleetUsecase personalFleetUsecase;
  PersonalFleetBloc(
    this.personalFleetUsecase,
  ) : super(PersonalFleetInitial()) {
    on<SubmitPersonalFleet>((event, emit) async {
      emit(PersonalFleetLoading());
      final failureOrEntity = await personalFleetUsecase.call(event.request);
      failureOrEntity.fold((failure) {
        emit(PersonalFleetFailure(_mapFailureToMessage(failure)));
      }, (response) {
        emit(PersonalFleetSuccess(fleetCreatePersonalResponse: response));
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
