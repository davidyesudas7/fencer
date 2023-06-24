part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class TextValidState extends LoginState {}

class TextErrorState extends LoginState {
  final String error;

  TextErrorState({required this.error});
}

class LoginLoadingState extends LoginState {}

class LoginSubmittedState extends LoginState {}
