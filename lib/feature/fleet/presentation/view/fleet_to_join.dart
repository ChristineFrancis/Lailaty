import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lailaty/core/config/presentation/widget/custom_appbar.dart';
import 'package:lailaty/core/config/presentation/widget/myButton.dart';
import 'package:lailaty/core/config/storage/service_locator.dart';
import 'package:lailaty/core/resources/color_manager.dart';
import 'package:lailaty/core/resources/key_manager.dart';
import 'package:lailaty/core/resources/string_manager.dart';
import 'package:lailaty/core/resources/style_maneger.dart';
import 'package:lailaty/core/utils/build_context_extensions.dart';
import 'package:lailaty/feature/fleet/presentation/state_manager/bloc/get_searched_fleet_bloc.dart';
import 'package:lailaty/feature/fleet/presentation/state_manager/get_all_fleets/get_all_fleets_bloc.dart';
import 'package:lailaty/feature/fleet/presentation/widgets/fleet_to_join_widget/search_container.dart';
import '../widgets/fleet_to_join_widget/custom_dropdown.dart';

class FleetToJoinPage extends StatefulWidget {
  const FleetToJoinPage({super.key});

  @override
  State<FleetToJoinPage> createState() => _FleetToJoinPageState();
}

class _FleetToJoinPageState extends State<FleetToJoinPage> {
  String? _selectedFleetName;
  String _searchText = '';

  void _onFleetSelected(String name) {
    setState(() {
      _selectedFleetName = name;
      _searchText = '';
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('تم العثور على الأسطول!', textAlign: TextAlign.right),
        backgroundColor: Colors.green,
      ),
    );
  }

  void _onDropdownSelected(String name) {
    setState(() {
      _selectedFleetName = name;
      _searchText = '';
    });
  }

  void _updateSearchText(String text) {
    setState(() {
      _searchText = text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (_) => GetAllFleetsBloc(sl())..add(RequestAllFleets())),
        BlocProvider(create: (_) => GetSearchedFleetBloc(sl())),
      ],
      child: Scaffold(
        backgroundColor: ColorManager.backGroundColor,
        appBar: CustomAppbar(ispop: true, title: ''),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: context.screenHeight * 0.02),
                Text(
                  StringManager.enterTheNameOfTheFleetYouWantToJoin,
                  style: StyleManager.semiboldTextStyle20(
                    color: ColorManager.black,
                    size: context.screenWidth * 0.05,
                  ),
                ),
                SizedBox(height: context.screenHeight * 0.02),
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: EdgeInsets.only(right: context.screenWidth * 0.05),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          " ${(_selectedFleetName != null) ? _selectedFleetName : ""} ",
                          style: StyleManager.semiboldTextStyle20(
                            color: ColorManager.black,
                            size: context.screenWidth * 0.05,
                          ),
                        ),
                        Text(
                          StringManager.fleetName,
                          style: StyleManager.semiboldTextStyle20(
                            color: ColorManager.black,
                            size: context.screenWidth * 0.05,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SearchContainer(
                  onSearchSuccess: _onFleetSelected,
                  searchText: _searchText,
                  onTextChange: _updateSearchText,
                ),
                CustomDropdown(
                  selectedFleetName: _selectedFleetName,
                  onSelect: _onDropdownSelected,
                ),
                SizedBox(height: context.screenHeight * 0.4),
                MyButton(
                  title: StringManager.next,
                  onpress: () {
                    context.push(AppKeys.personalInformationPageKey);
                  },
                  colors: ColorManager.grey1,
                  width: context.screenWidth * 0.7,
                  height: context.screenHeight * 0.05,
                  radius: 5,
                  styleOfTExt: StyleManager.semiboldTextStyle20(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
