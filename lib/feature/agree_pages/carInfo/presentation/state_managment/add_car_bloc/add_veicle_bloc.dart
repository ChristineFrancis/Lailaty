// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lailaty/core/error_manager/failures.dart';
import 'package:lailaty/core/resources/string_manager.dart';
import 'package:lailaty/feature/agree_pages/carInfo/domain/entities/car_registration_request_entity.dart';
import 'package:lailaty/feature/agree_pages/carInfo/domain/entities/motorcycle_registration_request_entity.dart';
import 'package:lailaty/feature/agree_pages/carInfo/domain/entities/vehicle_registration_response_entity.dart';
import 'package:lailaty/feature/agree_pages/carInfo/domain/use_case/add_car_usecase.dart';
import 'package:lailaty/feature/agree_pages/carInfo/domain/use_case/add_motor_usecase.dart';
part 'add_veicle_event.dart';
part 'add_veicle_state.dart';

class AddVeicleBloc extends Bloc<AddVeicleEvent, AddVeicleState> {
  final AddCarUsecase addCarUsecase;
  final AddMotorUsecase addMotorUsecase;

  AddVeicleBloc({
    required this.addCarUsecase,
    required this.addMotorUsecase,
  }) : super(AddVeicleInitial()) {
    on<AddCarEvent>(_onAddCar);
    on<AddMotorEvent>(_onAddMotor);
  }

  Future<void> _onAddCar(
      AddCarEvent event, Emitter<AddVeicleState> emit) async {
    emit(AddVeicleLoading());

    final Either<Failure, VehicleRegistrationResponse> result =
        await addCarUsecase(event.carViecleEntity, event.typeViecle);

    result.fold(
      (failure) => emit(AddVeicleFailure(_mapFailureToMessage(failure))),
      (response) {
        final int vehicleId = response.vehicle.id;
        emit(AddVeicleSuccess("تم تسجيل المركبة بنجاح. المعرف: $vehicleId"));
      },
    );
  }

  Future<void> _onAddMotor(
      AddMotorEvent event, Emitter<AddVeicleState> emit) async {
    emit(AddVeicleLoading());

    final Either<Failure, VehicleRegistrationResponse> result =
        await addMotorUsecase(event.motorInfoBaseEntity, event.typeVeicle);

    result.fold(
      (failure) => emit(AddVeicleFailure(_mapFailureToMessage(failure))),
      (response) {
        emit(const AddVeicleSuccess("تم تسجيل الدراجة النارية بنجاح. "));
      },
    );
  }

  String _mapFailureToMessage(Failure failure) {
    if (failure is ServerFailure) {
      return failure.message;
    } else if (failure is NoConnectionFailure) {
      return StringManager.noInternetConnection;
    } else {
      return "حدث خطأ غير متوقع";
    }
  }
}
