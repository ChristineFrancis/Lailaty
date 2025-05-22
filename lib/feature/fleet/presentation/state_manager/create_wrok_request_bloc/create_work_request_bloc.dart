import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:lailaty/core/error_manager/failures.dart';
import 'package:lailaty/core/resources/string_manager.dart';
import 'package:lailaty/feature/fleet/domain/entities/fleet_to_join/create_work_request_entity.dart';
import 'package:lailaty/feature/fleet/domain/usecases/create_work_request_usecase.dart';
import 'package:meta/meta.dart';

part 'create_work_request_event.dart';
part 'create_work_request_state.dart';

class CreateWorkRequestBloc
    extends Bloc<CreateWorkRequestEvent, CreateWorkRequestState> {
  final CreateWorkRequestUsecase createWorkRequestUsecase;

  CreateWorkRequestBloc({required this.createWorkRequestUsecase})
      : super(CreateWorkRequestInitial()) {
    on<SubmitWorkRequest>((event, emit) async {
      emit(CreateWorkRequestLoading());

      final failureOrEntity =
          await createWorkRequestUsecase.call(event.officeId);

      failureOrEntity.fold(
        (failure) {
          emit(CreateWorkRequestFailure(_mapFailureToMessage(failure)));
        },
        (entity) {
          emit(CreateWorkRequestSuccess(entity));
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
