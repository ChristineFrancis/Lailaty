import 'package:dartz/dartz.dart';
import 'package:lailaty/core/error_manager/failures.dart';
import 'package:lailaty/feature/agree_pages/carInfo/domain/entities/captain_registration_documents_request.dart';
import 'package:lailaty/feature/agree_pages/carInfo/domain/entities/captain_registration_documents_response_message.dart';
import 'package:lailaty/feature/agree_pages/carInfo/domain/repositories/agree_page_repository.dart';

class CaptainRegistrationUsecase {
  AgreePageRepository repo;
  CaptainRegistrationUsecase({
    required this.repo,
  });
  Future<Either<Failure, CaptainRegistrationDocumentsResponseMessage>> call(
      CaptainRegistrationDocumentsRequest captainRegister) async {
    return await repo.captainRegister(captainRegister);
  }
}
