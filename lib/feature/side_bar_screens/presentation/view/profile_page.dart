import 'package:flutter/material.dart';
import 'package:lailaty/core/config/widget/custom_appbar.dart';
import 'package:lailaty/core/resources/color_manager.dart';
import 'package:lailaty/core/resources/key_manager.dart';
import 'package:lailaty/core/resources/string_manager.dart';
import 'package:lailaty/core/utils/build_context_extensions.dart';
import 'package:lailaty/core/viewmodels/personal_information_view.dart';
import 'package:lailaty/feature/side_bar_screens/presentation/state_managment/car_list_view_model.dart';
import 'package:lailaty/feature/side_bar_screens/presentation/widgets/car_list_widget.dart';
import 'package:lailaty/feature/side_bar_screens/presentation/widgets/car_dialog.dart';
import 'package:lailaty/feature/side_bar_screens/presentation/widgets/edit_pesonal_image_widget.dart';
import 'package:lailaty/feature/side_bar_screens/presentation/widgets/form_profile_container.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late TextEditingController _firstNameController;
  late TextEditingController _lastNameController;
  late TextEditingController _phoneNumberController;
  late TextEditingController _editLocationController;
  @override
  void initState() {
    super.initState();
    _firstNameController = TextEditingController();
    _lastNameController = TextEditingController();
    _phoneNumberController = TextEditingController();
    _editLocationController = TextEditingController();
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _phoneNumberController.dispose();
    _editLocationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<CarListViewModel>();
    final personalImageViewModel = context.watch<PersonalInformationView>();
    final selectedImage =
        personalImageViewModel.getImage(AppKeys.personalPhotoEdit);

    return Scaffold(
      backgroundColor: ColorManager.backGroundColor,
      appBar: CustomAppbar(
        ispop: false,
        title: StringManager.profileTitle,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  EditPesonalImageWidget(
                      personalImageViewModel: personalImageViewModel,
                      selectedImage: selectedImage),
                  SizedBox(
                    height: context.screenHeight * 0.02,
                  ),
                  _buildCarList(context, viewModel),
                  SizedBox(
                    height: context.screenHeight * 0.02,
                  ),
                  FormProfileContainer(
                    controller: _firstNameController,
                    title: StringManager.firstName,
                    hintText: StringManager.fromBackData,
                    // errorMessage: 'error message',
                  ),
                  SizedBox(
                    height: context.screenHeight * 0.02,
                  ),
                  FormProfileContainer(
                    controller: _lastNameController,
                    title: StringManager.lastName,
                    hintText: StringManager.fromBackData,
                    // errorMessage: 'error message',
                  ),
                  SizedBox(
                    height: context.screenHeight * 0.02,
                  ),
                  FormProfileContainer(
                    controller: _phoneNumberController,
                    title: StringManager.phoneNumber,
                    hintText: StringManager.fromBackData,
                    // errorMessage: 'error message',
                    keyboardType: TextInputType.number,
                    // customValidator: (value) {
                    //   if (value == null || value.isEmpty) {
                    //     return 'Phone number is required';
                    //   }
                    //   if (value.length != 10) {
                    //     return 'Please enter exactly 10 digits.';
                    //   }
                    //   return null;
                    // },
                  ),
                  SizedBox(
                    height: context.screenHeight * 0.02,
                  ),
                  FormProfileContainer(
                    controller: _editLocationController,
                    title: StringManager.editLocation,
                    hintText: StringManager.fromBackData,
                    // errorMessage: 'error message',
                  ),
                  SizedBox(
                    height: context.screenHeight * 0.02,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding:
                EdgeInsets.symmetric(vertical: context.screenHeight * 0.02),
            child: Center(
              child: InkWell(
                onTap: () {
                  //send the updates to back
                },
                child: Container(
                  width: context.screenWidth * 0.65,
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 5,
                  ),
                  decoration: BoxDecoration(
                    color: ColorManager.grey1,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                    child: Text(
                      StringManager.tam,
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: context.screenWidth * 0.05,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCarList(BuildContext context, CarListViewModel viewModel) {
    return CarListWidget(
      screenWidth: context.screenWidth,
      screenHeight: context.screenHeight,
      onEdit: (context, viewModel, index) {
        _showEditDialog(context, viewModel, index);
      },
    );
  }

  void _showEditDialog(
      BuildContext context, CarListViewModel viewModel, int index) {
    final car = viewModel.cars[index];
    final nameController = TextEditingController(text: car.name);
    showDialog(
      context: context,
      builder: (context) {
        return CarDialog(
          nameController: nameController,
          car: car,
          viewModel: viewModel,
          index: index,
        );
      },
    );
  }
}
