class NoConnectionExecption implements Exception {}

//class ServerExecption implements Exception {}
class ServerException implements Exception {
  final String message;
  const ServerException([this.message = 'Server Exception Occurred']);
}

class EmptyCashExecption implements Exception {}
