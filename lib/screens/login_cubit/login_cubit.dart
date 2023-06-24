import 'package:fencing/domain/login_location_usecases.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  Location _location = Location();

  void textvalid(String email, String password) {
    if (email.isNotEmpty &&
        email.contains('@') &&
        password.isNotEmpty &&
        password.length >= 8) {
      emit(TextValidState());
    } else {
      emit(TextErrorState(error: 'please enter a valid email and password'));
    }
  }

  void loginsubmit() async {
    if (state is TextValidState) {
      emit(LoginLoadingState());

      await _location.startLocationUpdates();
      emit(LoginSubmittedState());
    }
  }
}
