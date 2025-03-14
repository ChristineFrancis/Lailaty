import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:lailaty/core/config/storage/service_locator.dart';
import 'package:lailaty/core/go_router/go_router.dart';
import 'package:lailaty/core/state_managments/image_picker_cubit/image_pick_cubit.dart';
import 'package:lailaty/core/state_managments/network_bloc/net_work_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((_) {
    runApp(
      MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => PersonalInformationCubit(),
          ),
          BlocProvider(
            create: (context) =>
                NetWorkBloc(InternetConnectionChecker.createInstance()),
          ),
        ],
        child: const MyApp(),
      ),
    );
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<NetWorkBloc, NetWorkState>(
      listener: (context, state) {
        if (state is NetWorkOffline) {
          print('no internet');
        } else if (state is NetWorkOnline) {
          print('internet back');
        }
      },
      child: MaterialApp.router(
        routerConfig: Routes().router,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

//! fixing the call us page : >> text <<
//! editing car in the profile page in sidebar <<
//TODO:
//! have do extra steps for IOS in the phone orientation?