import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lailaty/core/config/storage/secure_storage_service.dart';
import 'package:lailaty/core/config/storage/service_locator.dart';
import 'package:lailaty/core/presentation/widget/Titles.dart';
import 'package:lailaty/core/presentation/widget/alerts/problem_dialog.dart';
import 'package:lailaty/core/presentation/widget/custom_appbar.dart';
import 'package:lailaty/core/presentation/widget/my_sized_box.dart';
import 'package:lailaty/core/presentation/widget/textWithButon.dart';
import 'package:lailaty/core/presentation/widget/textWithExpansionTile.dart';
import 'package:lailaty/core/presentation/widget/text_with_textfield.dart';
import 'package:lailaty/core/resources/color_manager.dart';
import 'package:lailaty/core/resources/string_manager.dart';
import 'package:lailaty/core/resources/style_maneger.dart';
import 'package:lailaty/core/state_managments/image_picker_cubit/image_pick_cubit.dart';
import 'package:lailaty/feature/agree_pages/carInfo/domain/entities/motorcycle_registration_request_entity.dart';
import 'package:lailaty/feature/agree_pages/carInfo/presentation/state_managment/add_car_bloc/add_veicle_bloc.dart';
import 'package:lailaty/feature/agree_pages/carInfo/presentation/view/widgets/car_info_page/my_container_with_bottom_border.dart';
import 'package:lailaty/feature/agree_pages/carInfo/presentation/view/widgets/motor_info_page/add_motor_photo_widget.dart';
import '../../../../../core/presentation/widget/accept_button_customer.dart';
import '../../../../../core/resources/key_manager.dart';
import 'widgets/motor_info_page/add_photo_licence_motor.dart';

class MotorInfoView extends StatefulWidget {
  const MotorInfoView({super.key});

  @override
  State<MotorInfoView> createState() => _MotorInfoViewState();
}

class _MotorInfoViewState extends State<MotorInfoView> {
  String selectedModelYear = '1970';
  final List<String> yearsOptions = ['1990', '1980', '1960', '1950'];
  TextEditingController plateNumber = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final secureStorageService = sl<SecureStorageService>();

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<PersonalInformationCubit>();
    return BlocProvider(
      create: (_) => sl<AddVeicleBloc>(),
      child: BlocListener<AddVeicleBloc, AddVeicleState>(
        listener: (context, state) async {
          if (state is AddVeicleSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
            await secureStorageService.setLocalBool('car_doc_valid', true);
            context.go(AppKeys.noticeToDriverPath);
          } else if (state is AddVeicleFailure) {
            showDialog(
              context: context,
              builder: (_) => ProblemDialog(
                message: state.message,
              ),
            );
          }
        },
        child: Scaffold(
          backgroundColor: ColorManager.backGroundColor,
          appBar: CustomAppbar(
            ispop: true,
            title: StringManager.motorInfo,
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWithExpansionTileSelector(
                        label: StringManager.yearMade,
                        selectedValue: selectedModelYear,
                        options: yearsOptions,
                        onSelected: (value) =>
                            setState(() => selectedModelYear = value),
                      ),
                      TextWithTextfield(
                        controller: plateNumber,
                        text: StringManager.plateNumber,
                        textOfOption: "12324",
                        validatorText: "يرجى إدخال رقم اللوحة",
                      ),
                      myContainerWithBottomBorder(
                        contentWidget: Column(
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: HeaderText(
                                text: StringManager.photoMotor,
                                styleOfText: StyleManager.normalText18(
                                    color: ColorManager.black),
                              ),
                            ),
                            const sizedBox50(),
                            addMotorPhotoWidget(
                                viewModel: viewModel,
                                selectedPhoto:
                                    viewModel.getImage(AppKeys.motorPhoto)),
                            const sizedBox50(),
                          ],
                        ),
                      ),
                      myContainerWithBottomBorder(
                        contentWidget: Column(
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: HeaderText(
                                text: StringManager.photoLecienceCar,
                                styleOfText: StyleManager.normalText18(
                                    color: ColorManager.black),
                              ),
                            ),
                            const sizedBox50(),
                            addLecienceMotorPhotoWidget(
                              viewModel: viewModel,
                              selectedFrontPhoto:
                                  viewModel.getImage(AppKeys.frontMotorLicence),
                              selectedBackPhoto:
                                  viewModel.getImage(AppKeys.backMotorLicence),
                            ),
                            const sizedBox50(),
                          ],
                        ),
                      ),
                      TextWithButtonWidget(
                          onPress: () {},
                          text: StringManager.connectToserviceOfClients,
                          textbutton: StringManager.serviceOfCleints,
                          styleOfButtonText: StyleManager.smallBlackText16(
                              color: ColorManager.blueTextColor),
                          styleOfNormalText: StyleManager.smallBlackText16()),
                      const sizedBox50(),
                      BlocBuilder<AddVeicleBloc, AddVeicleState>(
                        builder: (context, state) {
                          switch (state) {
                            case AddVeicleLoading():
                              return const Center(
                                child: CircularProgressIndicator(
                                  color: ColorManager.grey1,
                                ),
                              );
                            default:
                              return acceptButtonCustomer(
                                text: StringManager.tam,
                                onPress: () {
                                  final formValid =
                                      _formKey.currentState!.validate();
                                  final imagesValid =
                                      viewModel.getImage(AppKeys.motorPhoto) !=
                                              null &&
                                          viewModel.getImage(
                                                  AppKeys.frontMotorLicence) !=
                                              null &&
                                          viewModel.getImage(
                                                  AppKeys.backMotorLicence) !=
                                              null;

                                  if (formValid && imagesValid) {
                                    final motor = MotorcycleRegistrationRequest(
                                        modelYear: selectedModelYear,
                                        licensePlate: plateNumber.text,
                                        image1: viewModel
                                            .getImage(AppKeys.motorPhoto)!,
                                        face1: viewModel.getImage(
                                            AppKeys.frontMotorLicence)!,
                                        face2: viewModel.getImage(
                                            AppKeys.backMotorLicence)!);
                                    BlocProvider.of<AddVeicleBloc>(context).add(
                                      AddMotorEvent(
                                        typeVeicle: 'motorcycle',
                                        motorInfoBaseEntity: motor,
                                      ),
                                    );
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          !formValid
                                              ? "يرجى تعبئة جميع الحقول المطلوبة بشكل صحيح"
                                              : StringManager.uploadAllImages,
                                          textAlign: TextAlign.right,
                                        ),
                                      ),
                                    );
                                  }
                                },
                              );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
