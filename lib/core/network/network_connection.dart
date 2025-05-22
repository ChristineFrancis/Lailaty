// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
  Stream<InternetConnectionStatus> get onStatusChange;
  Stream<bool> get connectionStream;
}

class NetworkInfoImplement implements NetworkInfo {
  InternetConnectionChecker isConnect;
  NetworkInfoImplement({
    required this.isConnect,
  });
  @override
  Future<bool> get isConnected => isConnect.hasConnection;

  @override
  Stream<InternetConnectionStatus> get onStatusChange =>
      isConnect.onStatusChange;

  @override
  Stream<bool> get connectionStream => isConnect.onStatusChange.map((status) {
        return status == InternetConnectionStatus.connected;
      });
}
// get is a way to dont
