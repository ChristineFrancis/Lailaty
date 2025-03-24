// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:lailaty/core/error_manager/failures.dart';
import 'package:lailaty/core/resources/string_manager.dart';
import 'package:lailaty/feature/fleet/domain/entities/company_fleet/fleet_create_company_request_entity.dart';
import 'package:lailaty/feature/fleet/domain/entities/company_fleet/fleet_create_company_response_entity.dart';
import 'package:lailaty/feature/fleet/domain/usecases/create_fleet_company_usecase.dart';

part 'fleet_company_event.dart';
part 'fleet_company_state.dart';

class FleetCompanyBloc extends Bloc<FleetCompanyEvent, FleetCompanyState> {
  final CreateFleetCompanyUsecase fleetCompanyUsecase;
  FleetCompanyBloc({
    required this.fleetCompanyUsecase,
  }) : super(FleetCompanyInitial()) {
    on<SubmitFleetCompany>((event, emit) async {
      emit(FleetCompanyLoading());

      final failureOrEntity = await fleetCompanyUsecase.call(event.request);
      failureOrEntity.fold((failure) {
        emit(FleetCompanyFailure(_mapFailureToMessage(failure)));
      }, (response) {
        emit(FleetCompanySuccess(fleetCreateCompanyResponseEntity: response));
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
