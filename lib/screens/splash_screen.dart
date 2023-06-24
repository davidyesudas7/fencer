import 'package:fencing/screens/login_cubit/login_cubit.dart';
import 'package:fencing/screens/login_screen.dart';
import 'package:fencing/screens/splash_screen_cubit/splashscreen_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<SplashscreenCubit>(context).gotonext();
    return BlocListener<SplashscreenCubit, SplashscreenState>(
      listener: (context, state) {
        if (state is SplashscreenFinal) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => BlocProvider(
                        create: (context) => LoginCubit(),
                        child: const LoginScreen(),
                      )));
        }
      },
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Fencing',
                style: GoogleFonts.pacifico(
                  color: Colors.blue.shade900,
                  fontSize: 60,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
