import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;

  Failure(this.message);

  @override
  List<Object?> get props => [message];
}

class ServerFailure extends Failure {
  ServerFailure(super.message);
}

class NoConnectionFailure extends Failure {
  NoConnectionFailure(super.message);
}

class StorageFailure extends Failure {
  StorageFailure(super.message);
}
