import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lailaty/core/config/presentation/widget/custom_appbar.dart';
import 'package:lailaty/core/config/presentation/widget/offline_dialog_widget.dart';
import 'package:lailaty/core/config/storage/service_locator.dart';
import 'package:lailaty/core/resources/color_manager.dart';
import 'package:lailaty/core/resources/key_manager.dart';
import 'package:lailaty/core/resources/string_manager.dart';
import 'package:lailaty/core/state_managments/network_bloc/net_work_bloc.dart';
import 'package:lailaty/core/utils/build_context_extensions.dart';
import 'package:lailaty/core/config/presentation/widget/client_service_row.dart';
import 'package:lailaty/core/state_managments/image_picker_cubit/image_pick_cubit.dart';
import 'package:lailaty/feature/agree_pages/carInfo/domain/entities/captain_registration_documents_request.dart';
import 'package:lailaty/feature/agree_pages/carInfo/presentation/state_managment/captain_register_bloc/captain_register_bloc.dart';
import 'package:lailaty/feature/agree_pages/carInfo/presentation/state_managment/captain_register_bloc/captain_register_event.dart';
import 'package:lailaty/feature/agree_pages/carInfo/presentation/state_managment/captain_register_bloc/captain_register_state.dart';
import 'package:lailaty/feature/agree_pages/carInfo/service_locator.dart';
import 'package:lailaty/feature/agree_pages/presentation/widgets/personal_Information_page/details_text_widget.dart';
import 'package:lailaty/feature/agree_pages/presentation/widgets/personal_Information_page/next_botton_widget.dart';
import 'package:lailaty/feature/agree_pages/presentation/widgets/personal_Information_page/title_for_details_widget.dart';
import 'package:lailaty/feature/agree_pages/presentation/widgets/security_information_page/good_conduct_certificate.dart';

class SecurityInformationPage extends StatelessWidget {
  final String birthDate;
  const SecurityInformationPage({super.key, required this.birthDate});

  @override
  Widget build(BuildContext context) {
    const sectionId = AppKeys.certificate;
    final viewModel = context.watch<PersonalInformationCubit>();
    final selectedImage = viewModel.getImage(sectionId);

    return BlocProvider(
      create: (context) => sl<CaptainRegisterBloc>(), //{
      // return CaptainRegisterBloc(
      //   captainRegisterUseCase: CaptainRegistrationUsecase(
      //     repo: AgreePagesRepoImpl(
      //       agreePagesRemoteDateSource:
      //           AgreePagesRemoteDateSourceImpl(client: http.Client()),
      //       networkInfo: NetworkInfoImplement(
      //           isConnect: InternetConnectionChecker.instance),
      //     ),
      //   ),
      // );
      // },
      child: BlocListener<CaptainRegisterBloc, CaptainRegisterState>(
        listener: (context, state) {
          if (state is CaptainRegisterSuccess) {
            print('Captain registration success: ${state.message}');
            context.push(AppKeys.loginPromptPageKey);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: ColorManager.green,
                content: Text(
                  state.message,
                  textAlign: TextAlign.right,
                ),
              ),
            );
          } else if (state is CaptainRegisterFailure) {
            print('Captain registration failed: ${state.errorMessage}');
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: ColorManager.errorColor,
                content: Text(
                  state.errorMessage,
                  textAlign: TextAlign.right,
                ),
              ),
            );
          }
          // else if (state is CaptainRegisterOffline) {
          //   showDialog(
          //     context: context,
          //     builder: (context) {
          //       return const OfflineDialogWidget();
          //     },
          //   );
          // }
        },
        child: Scaffold(
          backgroundColor: ColorManager.backGroundColor,
          appBar: CustomAppbar(
            ispop: true,
            title: StringManager.securityInformation,
          ),
          body: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      GoodConductCertificateContainer(
                        selectedImage: selectedImage,
                        viewModel: viewModel,
                        sectionId: sectionId,
                      ),
                      const TitleForDetailsWidget(
                        title: StringManager.declarationAndCommitment,
                      ),
                      Text(
                        StringManager.ensureAppSafetyMessage,
                        style: TextStyle(
                          fontSize: context.screenWidth * 0.04,
                          fontWeight: FontWeight.w500,
                          color: ColorManager.black,
                        ),
                      ),
                      Text(
                        StringManager.goodConductCertificateMessage,
                        style: TextStyle(
                          fontSize: context.screenWidth * 0.04,
                          fontWeight: FontWeight.w500,
                          color: ColorManager.black,
                        ),
                      ),
                      const DetailsText(
                        text: StringManager.agreeAndCommitMessage,
                      ),
                      const DetailsText(
                        text: StringManager.certificateRequiredMessage,
                      ),
                      const DetailsText(
                        text: StringManager.delayWillSuspendAccountMessage,
                      ),
                      SizedBox(
                        height: context.screenHeight * 0.25,
                      ),
                      const ClientServiceRow(),
                      SizedBox(
                        height: context.screenHeight * 0.1,
                      ),
                    ],
                  ),
                ),
              ),
              BlocBuilder<CaptainRegisterBloc, CaptainRegisterState>(
                builder: (context, state) {
                  if (state is CaptainRegisterLoading) {
                    return const Center(
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: CircularProgressIndicator(
                          color: ColorManager.grey1,
                        ),
                      ),
                    );
                  }
                  return NextBotton(
                    onTap: () {
                      final networkState = context.read<NetWorkBloc>().state;
                      if (networkState is NetWorkOffline) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return const OfflineDialogWidget();
                          },
                        );
                        return;
                      }
                      final personalPhoto =
                          viewModel.getImage(AppKeys.personalPhoto);
                      final nationalIdFront =
                          viewModel.getImage(AppKeys.nationalIdFront);
                      final nationalIdBack =
                          viewModel.getImage(AppKeys.nationalIdBack);
                      final licenseFront =
                          viewModel.getImage(AppKeys.nationalIdFront);
                      final licenseBack =
                          viewModel.getImage(AppKeys.licenseBack);

                      if (personalPhoto != null &&
                          nationalIdFront != null &&
                          nationalIdBack != null &&
                          licenseFront != null &&
                          licenseBack != null) {
                        final request = CaptainRegistrationDocumentsRequest(
                          personalImage: personalPhoto,
                          personalCardFrontFace: nationalIdFront,
                          personalCardBackFace: nationalIdBack,
                          driverLicenseFrontFace: licenseFront,
                          driverLicenseBackFace: licenseBack,
                          birthDate: birthDate,
                          criminalRecord: selectedImage,
                        );
                        print('data okay');

                        context
                            .read<CaptainRegisterBloc>()
                            .add(SubmitCaptainRegistration(request));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              StringManager.uploadAllImages,
                              textAlign: TextAlign.right,
                            ),
                          ),
                        );
                      }
                    },
                  );
                },
              ),
            ],
          ),
          // ),
        ),
      ),
    );
  }
}
