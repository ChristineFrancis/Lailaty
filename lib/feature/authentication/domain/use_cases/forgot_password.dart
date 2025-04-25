import 'package:dartz/dartz.dart';
import 'package:lailaty/core/error_manager/failures.dart';
import '../entities/forgot_password_request.dart';
import '../entities/forgot_password_response.dart';
import '../repositories/auth_repository.dart';

class ForgotPassword {
  final AuthRepository repository;
  const ForgotPassword({required this.repository});

  Future<Either<Failure, ForgotPasswordResponse>> call(
      ForgotPasswordRequest request) async {
    return await repository.forgotPassword(request);
  }
}
