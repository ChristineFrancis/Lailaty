import 'package:dartz/dartz.dart';
import 'package:lailaty/common%20features/authentication/data/models/user_model.dart';
import 'package:lailaty/common%20features/authentication/domain/entities/info_register_request.dart';
import 'package:lailaty/common%20features/authentication/domain/repositories/auth_repository.dart';
import 'package:lailaty/core/error_manager/failures.dart';

class InformationRegister {
  final AuthRepository repository;
  const InformationRegister({required this.repository});

  Future<Either<Failure, UserModel>> call(InfoRegisterRequest request) async {
    return await repository.informationRegister(request);
  }
}
