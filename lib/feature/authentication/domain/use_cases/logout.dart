import 'package:dartz/dartz.dart';
import 'package:lailaty/core/error_manager/failures.dart';
import '../entities/logout_request.dart';
import '../entities/logout_response.dart';
import '../repositories/auth_repository.dart';

class Logout {
  final AuthRepository repository;
  const Logout({required this.repository});

  Future<Either<Failure, LogoutResponse>> call(LogoutRequest request) async {
    return await repository.logout(request);
  }
}
