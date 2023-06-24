import 'package:fencing/screens/cubit/geofencig_cubit.dart';
import 'package:fencing/screens/home_screen.dart';
import 'package:fencing/screens/login_cubit/login_cubit.dart';
import 'package:fencing/widgets_constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginTextfield extends StatelessWidget {
  const LoginTextfield({
    super.key,
    this.onchange,
    required this.hinttext,
    required this.textcontroler,
  });
  final Function(String value)? onchange;
  final String hinttext;
  final TextEditingController textcontroler;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: TextField(
        controller: textcontroler,
        decoration:
            InputDecoration(border: kTextFieldborder, hintText: hinttext),
        onChanged: onchange,
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
    required this.ontap,
  });

  final Function() ontap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: 60,
        width: 200,
        color: Colors.blue.shade900,
        child: Center(
            child: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state is LoginSubmittedState) {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => BlocProvider(
                            create: (context) => GeofencigCubit(),
                            child: const HomeScreen(),
                          )));
            }
          },
          builder: (context, state) {
            if (state is LoginLoadingState) {
              return const Center(child: CircularProgressIndicator());
            }
            return Text('Sign In',
                style: GoogleFonts.sourceSansPro(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold));
          },
        )),
      ),
    );
  }
}
