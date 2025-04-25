import 'package:dartz/dartz.dart';
import '../../../../core/error_manager/failures.dart';
import '../entities/login_request.dart';
import '../entities/login_response.dart';
import '../repositories/auth_repository.dart';

class Login {
  final AuthRepository repository;
  const Login({required this.repository});

  Future<Either<Failure, LoginResponse>> call(LoginRequest request) async {
    return await repository.login(request);
  }
}
