part of 'login_cubit.dart';

abstract class LoginState {}

class LoginInitialState extends LoginState {}

class LoginLoadingState extends LoginState {
  String? loadingMessage;

  LoginLoadingState({this.loadingMessage});
}

class LoginSuccessState extends LoginState {
  LoginResponseEntityModel loginResponseEntityModel;

  LoginSuccessState({required this.loginResponseEntityModel});
}

class LoginErrorState extends LoginState {
  String? errorMessage;

  LoginErrorState({this.errorMessage});
}
