import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lailaty/core/config/storage/secure_storage_service.dart';
import 'package:lailaty/core/config/storage/service_locator.dart';
import 'package:lailaty/core/presentation/widget/Titles.dart';
import 'package:lailaty/core/presentation/widget/alerts/problem_dialog.dart';
import 'package:lailaty/core/presentation/widget/custom_appbar.dart';
import 'package:lailaty/core/presentation/widget/myButton.dart';
import 'package:lailaty/core/presentation/widget/my_sized_box.dart';
import 'package:lailaty/core/presentation/widget/textWithButon.dart';
import 'package:lailaty/core/presentation/widget/text_with_textfield.dart';
import 'package:lailaty/core/resources/color_manager.dart';
import 'package:lailaty/core/resources/key_manager.dart';
import 'package:lailaty/core/resources/string_manager.dart';
import 'package:lailaty/core/resources/style_maneger.dart';
import 'package:lailaty/core/state_managments/image_picker_cubit/image_pick_cubit.dart';
import 'package:lailaty/feature/agree_pages/carInfo/domain/entities/car_registration_request_entity.dart';
import 'package:lailaty/feature/agree_pages/carInfo/presentation/state_managment/add_car_bloc/add_veicle_bloc.dart';
import 'package:lailaty/feature/agree_pages/carInfo/presentation/state_managment/brands_car_bloc/get_brands_car_bloc.dart';
import 'package:lailaty/feature/agree_pages/carInfo/presentation/view/widgets/car_info_page/add_back_car_photo_widget.dart';
import 'package:lailaty/feature/agree_pages/carInfo/presentation/view/widgets/car_info_page/add_car_lecience_photo.dart';
import 'package:lailaty/feature/agree_pages/carInfo/presentation/view/widgets/car_info_page/add_inner_car_photo_widget.dart';
import 'package:lailaty/feature/agree_pages/carInfo/presentation/view/widgets/car_info_page/add_left_car_photo_widget%20copy%203.dart';
import 'package:lailaty/feature/agree_pages/carInfo/presentation/view/widgets/car_info_page/add_right_car_photo_widget%20copy.dart';
import '../../../../../core/presentation/widget/accept_button_customer.dart';
import '../../../../../core/presentation/widget/textWithExpansionTile.dart';
import 'widgets/car_info_page/add_front_car_photo_widget copy 2.dart';
import 'widgets/car_info_page/my_container_with_bottom_border.dart';

class CarInfoView extends StatefulWidget {
  final VoidCallback? onNavigate;
  const CarInfoView({
    Key? key,
    this.onNavigate,
  }) : super(key: key);

  @override
  State<CarInfoView> createState() => _CarInfoViewState();
}

class _CarInfoViewState extends State<CarInfoView> {
  String selectedGear = 'اوتوماتيك';
  final Map<String, String> gearTypeApiValues = {
    'اوتوماتيك': 'auto',
    'مانويل': 'manual',
  };
  String selectedOriginalCarType = '';
  String selectedNewCarType = '';
  String selectedSeats = '٤ مقاعد';
  String slectedCarMadeYear = '1970';
  final List<String> yearsOptions = ['1990', '1980', '1960', '1950'];
  bool moreThanFourSeats = false;

  final List<String> gearOptions = ['اوتوماتيك', 'مانويل'];
  Map<String, int> carBrandNameToId = {};
  int? selectedOriginalCarId;

  final List<String> seatOptions = ['٤ مقاعد', 'أكثر من ٤ مقاعد'];

  TextEditingController colorController = TextEditingController();
  TextEditingController plateController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final secureStorageService = sl<SecureStorageService>();
  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<PersonalInformationCubit>();
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => sl<AddVeicleBloc>(),
        ),
        BlocProvider(
          create: (context) => sl<GetBrandsCarBloc>()..add(FetchBrandsCar()),
        ),
      ],
      child: Scaffold(
          backgroundColor: ColorManager.backGroundColor,
          appBar: CustomAppbar(
            ispop: true,
            title: StringManager.carInfo,
          ),
          body: BlocConsumer<AddVeicleBloc, AddVeicleState>(
            listener: (context, state) async {
              if (state is AddVeicleSuccess) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      state.message,
                      textAlign: TextAlign.right,
                    ),
                    backgroundColor: ColorManager.green,
                    duration: const Duration(seconds: 1),
                  ),
                );
                //!must have navigation :

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
              // switch (state) {
              //   case AddVeicleSuccess(message: "success"):
              //     context.push(AppKeys.noticeToDriverPath);
              //     ScaffoldMessenger.of(context).showSnackBar(
              //       SnackBar(
              //         content: Text(state.message),
              //         backgroundColor: ColorManager.green,
              //         duration: const Duration(seconds: 1),
              //       ),
              //     );
              //     break;
              //   case AddVeicleFailure(message: "failed"):
              //     ScaffoldMessenger.of(context).showSnackBar(
              //       SnackBar(
              //         content: Text(state.message),
              //         backgroundColor: ColorManager.red,
              //         duration: const Duration(seconds: 1),
              //       ),
              //     );

              //   default:
              //     print("object");
              // }
            },
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: SingleChildScrollView(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BlocBuilder<GetBrandsCarBloc, GetBrandsCarState>(
                            builder: (context, state) {
                              List<String> options = [];
                              if (state is GetBrandsCarSuccess) {
                                carBrandNameToId = {
                                  for (var brand in state.brands)
                                    brand.name: brand.id,
                                };
                                options = carBrandNameToId.keys.toList();
                              } else if (state is GetBrandsCarLoading) {
                                options = [StringManager.loading];
                              } else {
                                options = [StringManager.searchFailed];
                              }

                              return TextWithExpansionTileSelector(
                                label: StringManager.typeOfCar,
                                selectedValue: selectedOriginalCarType,
                                options: options,
                                onSelected: (value) {
                                  if (state is GetBrandsCarFailure) {
                                    context
                                        .read<GetBrandsCarBloc>()
                                        .add(FetchBrandsCar());
                                  } else if (state is GetBrandsCarSuccess) {
                                    setState(() {
                                      selectedOriginalCarType = value;
                                      selectedOriginalCarId =
                                          carBrandNameToId[value];
                                      print(
                                          'selecte car: $selectedOriginalCarType , id : $selectedOriginalCarId');
                                    });
                                  }
                                },
                              );
                            },
                          ),
                          TextWithExpansionTileSelector(
                            label: StringManager.typeGeerOfCar,
                            selectedValue: selectedGear,
                            options: gearOptions,
                            onSelected: (value) =>
                                setState(() => selectedGear = value),
                          ),
                          TextWithExpansionTileSelector(
                              label: StringManager.numberOfChairsInCars,
                              selectedValue: selectedSeats,
                              options: seatOptions,
                              onSelected: (value) {
                                setState(() {
                                  selectedSeats = value;
                                  moreThanFourSeats =
                                      value == 'أكثر من ٤ مقاعد';
                                  print('');
                                });
                              }),
                          TextWithExpansionTileSelector(
                            label: StringManager.yearMade,
                            selectedValue: slectedCarMadeYear,
                            options: yearsOptions,
                            onSelected: (value) =>
                                setState(() => slectedCarMadeYear = value),
                          ),
                          TextWithTextfield(
                            controller: plateController,
                            text: StringManager.plateNumber,
                            textOfOption: "12324",
                            validatorText: "يرجى إدخال رقم السيارة",
                          ),
                          TextWithTextfield(
                            controller: colorController,
                            text: StringManager.carColor,
                            textOfOption: " أبيض",
                            validatorText: "يرجى إدخال لون السيارة",
                          ),
                          myContainerWithBottomBorder(
                            contentWidget: Column(
                              children: [
                                HeaderText(
                                    text: StringManager.editingCar,
                                    styleOfText:
                                        StyleManager.smallBlackText16()),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: MyButton(
                                      title: StringManager.pressHere,
                                      onpress: () async {
                                        final result = await context
                                            .push<Map<String, String>>(
                                          AppKeys.editingCarPage,
                                          extra: {
                                            'original': selectedOriginalCarType,
                                            'new': selectedNewCarType,
                                            'carOptions':
                                                carBrandNameToId.keys.toList(),
                                          },
                                        );

                                        if (result != null) {
                                          setState(() {
                                            selectedOriginalCarType =
                                                result['original']!;
                                            selectedNewCarType = result['new']!;
                                            print(
                                                'origin : $selectedOriginalCarType, new : $selectedNewCarType');
                                            print(
                                                '${carBrandNameToId[selectedNewCarType]}');
                                          });
                                        }
                                      },
                                      colors: ColorManager.semiBoldyellow,
                                      width: MediaQuery.of(context).size.width /
                                          3.2,
                                      height:
                                          MediaQuery.of(context).size.height /
                                              16,
                                      radius: 11,
                                      styleOfTExt:
                                          StyleManager.smallBlackText16()),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Align(
                              alignment: Alignment.center,
                              child: HeaderText(
                                text: StringManager.photoCar,
                                styleOfText: StyleManager.normalText18(
                                    color: ColorManager.black),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Align(
                              alignment: Alignment.center,
                              child: HeaderText(
                                text: StringManager.addphotoCar,
                                styleOfText: StyleManager.smallBlackText16(
                                    color: ColorManager.black),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: HeaderText(
                              text: StringManager.photosCar,
                              styleOfText: StyleManager.miniSmallText14(
                                color: ColorManager.black,
                              ),
                            ),
                          ),
                          myContainerWithBottomBorder(
                              contentWidget: Column(
                            children: [
                              FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    addBackCarPhotoWidget(
                                      viewModel: viewModel,
                                      selectedPhoto:
                                          viewModel.getImage(AppKeys.carBack),
                                    ),
                                    const SizedBox(
                                      width: 3,
                                    ),
                                    addFrontCarPhotoWidget(
                                      viewModel: viewModel,
                                      selectedPhoto:
                                          viewModel.getImage(AppKeys.carFront),
                                    ),
                                    const SizedBox(
                                      width: 3,
                                    ),
                                    addInnerCarPhotoWidget(
                                      viewModel: viewModel,
                                      selectedPhoto:
                                          viewModel.getImage(AppKeys.carInner),
                                    ),
                                  ],
                                ),
                              ),
                              const sizedBox50(),
                              FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    addLeftCarPhotoWidget(
                                      viewModel: viewModel,
                                      selectedPhoto:
                                          viewModel.getImage(AppKeys.carleft),
                                    ),
                                    const SizedBox(
                                      width: 3,
                                    ),
                                    addRightCarPhotoWidget(
                                      viewModel: viewModel,
                                      selectedPhoto:
                                          viewModel.getImage(AppKeys.carRight),
                                    ),
                                  ],
                                ),
                              ),
                              const sizedBox50(),
                            ],
                          )),
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
                              Align(
                                alignment: Alignment.center,
                                child: HeaderText(
                                  text: StringManager.photoFrontBackLecienceCar,
                                  styleOfText: StyleManager.miniSmallText14(
                                      color: ColorManager.black),
                                ),
                              ),
                              const sizedBox50(),
                              addLeciencePhotoWidget(
                                  viewModel: viewModel,
                                  selectedFrontPhoto: viewModel
                                      .getImage(AppKeys.frontLecienceCar),
                                  selectedBackPhoto: viewModel
                                      .getImage(AppKeys.backLecienceCar)),
                              const sizedBox50()
                            ],
                          )),
                          Center(
                            child: TextWithButtonWidget(
                                onPress: () {},
                                text: StringManager.connectToserviceOfClients,
                                textbutton: StringManager.serviceOfCleints,
                                styleOfButtonText:
                                    StyleManager.smallBlackText16(
                                        color: ColorManager.blueTextColor),
                                styleOfNormalText:
                                    StyleManager.smallBlackText16()),
                          ),
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
                                      final isFormValid =
                                          _formKey.currentState?.validate() ??
                                              false;

                                      if (!isFormValid) {
                                        return;
                                      }

                                      if (selectedOriginalCarId == null) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                              content: Text(
                                                  "يرجى اختيار نوع السيارة")),
                                        );
                                        return;
                                      }
                                      final allImagesSelected = viewModel
                                                  .getImage(AppKeys
                                                      .frontLecienceCar) !=
                                              null &&
                                          viewModel.getImage(
                                                  AppKeys.backLecienceCar) !=
                                              null &&
                                          viewModel.getImage(AppKeys.carBack) !=
                                              null &&
                                          viewModel
                                                  .getImage(AppKeys.carFront) !=
                                              null &&
                                          viewModel
                                                  .getImage(AppKeys.carInner) !=
                                              null &&
                                          viewModel
                                                  .getImage(AppKeys.carRight) !=
                                              null &&
                                          viewModel.getImage(AppKeys.carleft) !=
                                              null;

                                      if (allImagesSelected) {
                                        if (widget.onNavigate != null) {
                                          widget.onNavigate!();
                                        } else {
                                          bool isModified =
                                              selectedNewCarType !=
                                                  selectedOriginalCarType;
                                          final carEntity =
                                              CarRegistrationRequest(
                                            modelYear: slectedCarMadeYear,
                                            licensePlate: plateController.text,
                                            moreThanFourSeats:
                                                moreThanFourSeats,
                                            originalCarBrandId:
                                                selectedOriginalCarId,
                                            carBrandId: carBrandNameToId[
                                                    selectedNewCarType] ??
                                                0,
                                            isModified: isModified,
                                            gearType: gearTypeApiValues[
                                                    selectedGear] ??
                                                '',
                                            color: colorController.text,
                                            image1: viewModel
                                                .getImage(AppKeys.carBack)!,
                                            image2: viewModel
                                                .getImage(AppKeys.carFront)!,
                                            image3: viewModel
                                                .getImage(AppKeys.carInner)!,
                                            image4: viewModel
                                                .getImage(AppKeys.carRight)!,
                                            image5: viewModel
                                                .getImage(AppKeys.carleft)!,
                                            face1: viewModel.getImage(
                                                AppKeys.backLecienceCar)!,
                                            face2: viewModel.getImage(
                                                AppKeys.frontLecienceCar)!,
                                          );

                                          BlocProvider.of<AddVeicleBloc>(
                                                  context)
                                              .add(
                                            AddCarEvent(
                                              typeViecle: "car",
                                              carViecleEntity: carEntity,
                                            ),
                                          );
                                        }
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
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
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          )),
    );
  }
}
