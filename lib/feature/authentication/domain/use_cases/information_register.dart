import 'package:dartz/dartz.dart';
import 'package:lailaty/core/error_manager/failures.dart';
import 'package:lailaty/feature/authentication/data/models/user_model.dart';
import 'package:lailaty/feature/authentication/domain/entities/info_register_request.dart';
import 'package:lailaty/feature/authentication/domain/repositories/auth_repository.dart';

class InformationRegister {
  final AuthRepository repository;
  const InformationRegister({required this.repository});

  Future<Either<Failure, UserModel>> call(InfoRegisterRequest request) async {
    return await repository.informationRegister(request);
  }
}
