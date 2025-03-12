import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lailaty/core/go_router/go_router.dart';
import 'package:lailaty/core/viewmodels/image_picker_cubit/image_pick_cubit.dart';


void main() async {
  //  WidgetsFlutterBinding.ensureInitialized();
  //  await di.init();
  runApp(
    // MultiProvider(
    //   providers: [
    //     ChangeNotifierProvider(create: (context) => PersonalInformationView()),
    //   ],
    BlocProvider(
      create: (context) => PersonalInformationCubit(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: Routes().router,
      debugShowCheckedModeBanner: false,
    );
  }
}

//! fixing the call us page : >> text <<
//! editing car in the profile page in sidebar <<
