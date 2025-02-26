import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'default_event.dart';
part 'default_state.dart';

class DefaultBloc extends Bloc<DefaultEvent, DefaultState> {
  DefaultBloc() : super(DefaultInitial()) {
    on<DefaultEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
