import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'add_veicle_event.dart';
part 'add_veicle_state.dart';

class AddVeicleBloc extends Bloc<AddVeicleEvent, AddVeicleState> {
  AddVeicleBloc() : super(AddVeicleInitial()) {
    on<AddVeicleEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
