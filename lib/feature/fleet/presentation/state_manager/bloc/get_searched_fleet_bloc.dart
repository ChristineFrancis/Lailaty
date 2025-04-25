import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:lailaty/core/error_manager/failures.dart';
import 'package:lailaty/core/resources/string_manager.dart';
import 'package:lailaty/feature/fleet/domain/entities/fleet_to_join/fleets_entity.dart';
import 'package:lailaty/feature/fleet/domain/usecases/get_searched_fleet_usecase.dart';
import 'package:meta/meta.dart';

part 'get_searched_fleet_event.dart';
part 'get_searched_fleet_state.dart';

class GetSearchedFleetBloc
    extends Bloc<GetSearchedFleetEvent, GetSearchedFleetState> {
  final GetSearchedFleetUsecase getSearchedFleetUsecase;

  GetSearchedFleetBloc(this.getSearchedFleetUsecase)
      : super(GetSearchedFleetInitial()) {
    on<RequestForSearchFleet>(_onSearchFleetRequested);
  }

  Future<void> _onSearchFleetRequested(
    RequestForSearchFleet event,
    Emitter<GetSearchedFleetState> emit,
  ) async {
    emit(GetSearchedFleetLoading());

    final failureOrFleets = await getSearchedFleetUsecase.call(event.parameter);

    failureOrFleets.fold(
      (failure) {
        if (failure is NoConnectionFailure) {
          emit(GetSearchedFleetOffline(_mapFailureToMessage(failure)));
        } else {
          emit(GetSearchedFleetFailure(_mapFailureToMessage(failure)));
        }
      },
      (fleets) {
        emit(GetSearchedFleetSuccess(getAllFleetEntity: fleets));
      },
    );
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
