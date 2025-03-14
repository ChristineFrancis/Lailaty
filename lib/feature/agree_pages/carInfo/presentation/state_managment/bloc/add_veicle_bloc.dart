// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lailaty/core/error_manager/failures.dart';
import 'package:lailaty/feature/agree_pages/carInfo/domain/entities/car_veicle_entity.dart';
import 'package:lailaty/feature/agree_pages/carInfo/domain/entities/motor_viecle_entity.dart';
import 'package:lailaty/feature/agree_pages/carInfo/domain/use_case/add_car_usecase.dart';

part 'add_veicle_event.dart';
part 'add_veicle_state.dart';

class AddVeicleBloc extends Bloc<AddVeicleEvent, AddVeicleState> {
  AddCarUsecase addCarUsecase;

  AddVeicleBloc(
    this.addCarUsecase,
  ) : super(AddVeicleInitial()) {
    on<AddVeicleEvent>((event, emit) async {
      if (event is AddCarEvent) {
        print("bloc");
        emit(LoadingAddedState());
        final result =
            await addCarUsecase.call(event.carViecleEntity, event.typeViecle);
        emit(returnSuitableState(result, "success"));
      }
    });
  }
}

String messageTypeByFailure(Failure failure) {
  switch (failure.runtimeType) {
    case ServerFailure():
      return "server error";
    case NoConnectionFailure():
      return "no connection";
    default:
      return "something  went wrong ,please try again latter";
  }
}

AddVeicleState returnSuitableState(
    Either<Failure, Unit> either, String message) {
  return either.fold(
    (failure) => FailedAddedVeicleState(message: messageTypeByFailure(failure)),
    (_) => SuccessAddedState(message: message),
  );
}
