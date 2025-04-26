import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:lailaty/core/config/storage/service_locator.dart';
import 'package:lailaty/core/go_router/go_router.dart';
import 'package:lailaty/core/state_managments/image_picker_cubit/image_pick_cubit.dart';
import 'package:lailaty/core/state_managments/network_bloc/net_work_bloc.dart';

import 'package:lailaty/feature/authentication/presentation/bloc/information_register_bloc/information_register_bloc.dart';
import 'package:lailaty/feature/authentication/presentation/bloc/logout_bloc/logout_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initDependencies();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  runApp(
    // DevicePreview(
    //   enabled: !kReleaseMode,
    //   builder: (context) =>
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PersonalInformationCubit(),
        ),
        BlocProvider(
          create: (context) =>
              NetWorkBloc(InternetConnectionChecker.createInstance()),
        ),
        BlocProvider(
          create: (_) => sl<LogoutBloc>(),
        ),
        BlocProvider(
          create: (_) => sl<InformationRegisterBloc>(),
        ),
        // You can add more BlocProviders here if needed.
      ],
      child: const MyApp(),
      //   ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Listen for network state changes
    return BlocListener<NetWorkBloc, NetWorkState>(
      listener: (context, state) {
        if (state is NetWorkOffline) {
          print('no internet');
        } else if (state is NetWorkOnline) {
          print('internet back');
        }
      },
      child: MaterialApp.router(
        // Configure the router (this uses your custom Routes class)
        routerConfig: Routes().router,
        debugShowCheckedModeBanner: false,
        // DevicePreview integration:
        //  builder: DevicePreview.appBuilder,
        // locale: DevicePreview.locale(context),
        useInheritedMediaQuery: true,
        theme: ThemeData(
          fontFamily: "Sego", // Customize your theme here.
        ),
      ),
    );
  }
}



//! fixing the call us page : >> text <<
//! editing car in the profile page in sidebar <<
//TODO:
//! have do extra steps for IOS in the phone orientation?
//ToDO:
//!! don't forget to use the decider values
//__________________________________________________

//TODO :
// if the network status change we have to update the decider page

