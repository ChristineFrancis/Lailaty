import 'package:dartz/dartz.dart';
import 'package:lailaty/core/error_manager/failures.dart';
import '../entities/auth_request.dart';
import '../entities/auth_response.dart';
import '../repositories/auth_repository.dart';

class Register {
  final AuthRepository repository;
  const Register({required this.repository});

  Future<Either<Failure, AuthResponse>> call(AuthRequest request) async {
    return await repository.register(request);
  }
}
