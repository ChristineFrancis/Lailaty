import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lailaty/core/config/presentation/widget/custom_appbar.dart';
import 'package:lailaty/core/config/storage/secure_storage_service.dart';
import 'package:lailaty/core/config/storage/service_locator.dart';
import 'package:lailaty/core/resources/color_manager.dart';
import 'package:lailaty/core/resources/key_manager.dart';
import 'package:lailaty/core/resources/string_manager.dart';
import 'package:lailaty/core/state_managments/image_picker_cubit/image_pick_cubit.dart';
import 'package:lailaty/core/utils/build_context_extensions.dart';
import 'package:lailaty/feature/fleet/presentation/state_manager/fleet_company/fleet_company_bloc.dart';
import 'package:lailaty/feature/fleet/presentation/state_manager/personal_fleet/personal_fleet_bloc.dart';
import 'package:lailaty/feature/fleet/presentation/widgets/fleet_infromation_widget/company_fleet_information_widget.dart';
import 'package:lailaty/feature/fleet/presentation/widgets/fleet_infromation_widget/person_fleet_information_widget.dart';
import 'package:lailaty/feature/fleet/presentation/widgets/fleet_infromation_widget/selectable_container.dart';

class FleetInformationPage extends StatefulWidget {
  const FleetInformationPage({super.key});

  @override
  State<FleetInformationPage> createState() => _FleetInformationPageState();
}

class _FleetInformationPageState extends State<FleetInformationPage> {
  final ValueNotifier<int> selectedIndex =
      ValueNotifier<int>(1); // Use ValueNotifier for better performance

  // Controllers for company and personal fleet information
  final TextEditingController companyFleetNameController =
      TextEditingController();
  final TextEditingController companyAddressController =
      TextEditingController();
  final TextEditingController companyPhoneNumberController =
      TextEditingController();
  final TextEditingController personFleetNameController =
      TextEditingController();
  final TextEditingController personAddressController = TextEditingController();
  final TextEditingController personPhoneNumberController =
      TextEditingController();

  @override
  void dispose() {
    companyFleetNameController.dispose();
    companyAddressController.dispose();
    companyPhoneNumberController.dispose();
    personAddressController.dispose();
    personFleetNameController.dispose();
    personPhoneNumberController.dispose();
    selectedIndex.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final secureStorageService = sl<SecureStorageService>();

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<FleetCompanyBloc>(),
        ),
        BlocProvider(
          create: (context) => sl<PersonalFleetBloc>(),
        ),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<FleetCompanyBloc, FleetCompanyState>(
            listener: (context, state) async {
              if (state is FleetCompanySuccess) {
                context.go(AppKeys.fleetOptionsPage);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    backgroundColor: ColorManager.green,
                    content: Text(
                      StringManager.theFleetHasBeenEstablished,
                      textAlign: TextAlign.right,
                    ),
                  ),
                );
                await secureStorageService.setLocalBool('fleet_created', true);
              } else if (state is FleetCompanyFailure) {
                print('Captain registration failed: ////${state.errorMessage}');
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
            },
          ),
          BlocListener<PersonalFleetBloc, PersonalFleetState>(
            listener: (context, state) async {
              if (state is PersonalFleetSuccess) {
                context.go(AppKeys.fleetOptionsPage);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    backgroundColor: ColorManager.green,
                    content: Text(
                      StringManager.theFleetHasBeenEstablished,
                      textAlign: TextAlign.right,
                    ),
                  ),
                );
                await secureStorageService.setLocalBool('fleet_created', true);
              } else if (state is PersonalFleetFailure) {
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
            },
          ),
        ],
        child: Scaffold(
          backgroundColor: ColorManager.backGroundColor,
          appBar: CustomAppbar(
            ispop: false,
            title: StringManager.fleetInformation,
          ),
          body: Column(
            children: [
              SizedBox(height: context.screenHeight * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ValueListenableBuilder<int>(
                    valueListenable: selectedIndex,
                    builder: (context, index, _) {
                      return Row(
                        children: [
                          SelectableContainer(
                            isSelected: index == 0,
                            text: StringManager.person,
                            onTap: () => selectedIndex.value = 0,
                          ),
                          SizedBox(width: context.screenWidth * 0.02),
                          SelectableContainer(
                            isSelected: index == 1,
                            text: StringManager.company,
                            onTap: () => selectedIndex.value = 1,
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
              SizedBox(height: context.screenHeight * 0.02),
              Expanded(
                child: ValueListenableBuilder<int>(
                  valueListenable: selectedIndex,
                  builder: (context, index, _) {
                    return _buildDynamicContent(context, index);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDynamicContent(BuildContext context, int index) {
    final viewModel = context.watch<PersonalInformationCubit>();
    final selectedpostcardCopyImage =
        viewModel.getImage(AppKeys.postcardCopyImageKey);
    final selectedcommercialRegistrationImage =
        viewModel.getImage(AppKeys.commercialRegistrationImageKey);

    if (index == 0) {
      return PersonFleetInformationWidget(
        context: context,
        fleetNameController: personFleetNameController,
        addressController: personAddressController,
        personPhoneNumberController: personPhoneNumberController,
      );
    } else {
      return CompanyFleetInformationWidget(
        fleetNameController: companyFleetNameController,
        addressController: companyAddressController,
        selectedpostcardCopyImage: selectedpostcardCopyImage,
        selectedcommercialRegistrationImage:
            selectedcommercialRegistrationImage,
        viewModel: viewModel,
        companyPhoneNumberController: companyPhoneNumberController,
      );
    }
  }
}
