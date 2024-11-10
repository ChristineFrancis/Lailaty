import 'package:dartz/dartz.dart';
import 'package:lailaty/core/error_manager/failures.dart';
import 'package:lailaty/features/authentication/domain/entities/verification_code.dart';

abstract class VerificationRepository {
  Future < Either<Failure, List<VerificationCode>>> getVerificationCode();
}