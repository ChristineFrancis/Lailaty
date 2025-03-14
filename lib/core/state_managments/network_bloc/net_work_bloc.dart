import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

part 'net_work_event.dart';
part 'net_work_state.dart';

class NetWorkBloc extends Bloc<NetWorkEvent, NetWorkState> {
  final InternetConnectionChecker internetConnectionChecker;

  NetWorkBloc(this.internetConnectionChecker) : super(NetWorkInitial()) {
    on<NetWorkConnected>((event, emit) {
      emit(NetWorkOnline());
    });

    on<NetWrokDisconnected>((event, emit) {
      emit(NetWorkOffline());
    });

    _checkInterntetConnection();
  }

  void _checkInterntetConnection() {
    internetConnectionChecker.onStatusChange.listen((status) {
      if (status == InternetConnectionStatus.connected) {
        add(NetWorkConnected());
      } else {
        add(NetWrokDisconnected());
      }
    });
  }
}
