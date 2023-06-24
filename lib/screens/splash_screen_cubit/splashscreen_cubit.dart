import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'splashscreen_state.dart';

class SplashscreenCubit extends Cubit<SplashscreenState> {
  SplashscreenCubit() : super(SplashscreenInitial());

  void gotonext() async {
    await Future.delayed(Duration(seconds: 3));
    emit(SplashscreenFinal());
  }
}
