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
// for the page navigations :
  //final authState = AuthStateNotifier();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

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
        BlocProvider(
          create: (_) => sl<LogoutBloc>(),
        ),
        BlocProvider(
          create: (_) => sl<InformationRegisterBloc>(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

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
        routerConfig: Routes().router,
        debugShowCheckedModeBanner: false,
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
//to use the access token and the refresh if its 401


//TODO :تجنّب سباق تجديد التوكن (token refresh race): إذا أُرسل أكثر من طلب أثناء انتهاء الصلاحية، قد تحاول تجديد التوكن مرّتين. يمكنك استخدام قفل (mutex) أو مكتبة مثل dio_token_manager لحل المشكلة.
//TODO : make sure from the refresh token :)
//TODO : "FleetAddressContainer" don't forget it

