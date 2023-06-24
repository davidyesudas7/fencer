import 'package:fencing/screens/login_cubit/login_cubit.dart';
import 'package:fencing/widgets_constants/constants.dart';
import 'package:fencing/widgets_constants/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailcontroler = TextEditingController();
    TextEditingController passwordcontroler = TextEditingController();
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Login Page',
              style: GoogleFonts.pacifico(
                  fontSize: 40, color: Colors.blue.shade900),
            ),
            kSpaceBox,
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: BlocBuilder<LoginCubit, LoginState>(
                builder: (context, state) {
                  if (state is TextErrorState) {
                    return Text(
                      state.error,
                      style: const TextStyle(color: Colors.red),
                    );
                  }
                  return Container();
                },
              ),
            ),
            LoginTextfield(
              hinttext: 'email id',
              textcontroler: emailcontroler,
              onchange: (value) {
                BlocProvider.of<LoginCubit>(context)
                    .textvalid(emailcontroler.text, passwordcontroler.text);
              },
            ),
            LoginTextfield(
              hinttext: 'password',
              textcontroler: passwordcontroler,
              onchange: (value) {
                BlocProvider.of<LoginCubit>(context)
                    .textvalid(emailcontroler.text, passwordcontroler.text);
              },
            ),
            kSpaceBox,
            LoginButton(
              ontap: () {
                BlocProvider.of<LoginCubit>(context).loginsubmit();
              },
            )
          ],
        ),
      ),
    );
  }
}
