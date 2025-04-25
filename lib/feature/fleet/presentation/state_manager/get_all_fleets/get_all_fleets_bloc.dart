import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:lailaty/core/error_manager/failures.dart';
import 'package:lailaty/core/resources/string_manager.dart';
import 'package:lailaty/feature/fleet/domain/entities/fleet_to_join/fleets_entity.dart';
import 'package:lailaty/feature/fleet/domain/usecases/get_all_fleets_usecase.dart';
import 'package:meta/meta.dart';

part 'get_all_fleets_event.dart';
part 'get_all_fleets_state.dart';

class GetAllFleetsBloc extends Bloc<GetAllFleetsEvent, GetAllFleetsState> {
  final GetAllFleetsUsecase getAllFleetsUsecase;

  GetAllFleetsBloc(this.getAllFleetsUsecase) : super(GetAllFleetsInitial()) {
    on<RequestAllFleets>((event, emit) async {
      emit(GetAllFleetsLoading());

      final failureOrFleets = await getAllFleetsUsecase.call();

      failureOrFleets.fold(
        (failure) {
          emit(GetAllFleetsFailure(_mapFailureToMessage(failure)));
        },
        (fleets) {
          emit(GetAllFleetsSuccess(getAllFleetEntity: fleets));
        },
      );
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
