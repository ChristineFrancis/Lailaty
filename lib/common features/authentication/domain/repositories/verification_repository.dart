import 'package:dartz/dartz.dart';
import 'package:lailaty/common%20features/authentication/domain/entities/verification_code.dart';
import 'package:lailaty/core/error_manager/failures.dart';


abstract class VerificationRepository {
  Future < Either<Failure, List<VerificationCode>>> getVerificationCode();
}