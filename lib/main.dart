import 'package:fencing/screens/splash_screen.dart';
import 'package:fencing/screens/splash_screen_cubit/splashscreen_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fencing',
      theme: ThemeData(
        primaryColor: Colors.blue.shade900,
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => SplashscreenCubit(),
        child: const SplashScreen(),
      ),
    );
  }
}
