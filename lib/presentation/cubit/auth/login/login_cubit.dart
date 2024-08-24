import 'package:bloc/bloc.dart';
import 'package:ecommerce/domain/entitiy/auth_entitiy/login_entitiy/login_Response_Entitiy.dart';
import 'package:ecommerce/domain/use_case/auth_use_case/login_use_case.dart';
import 'package:flutter/material.dart';


part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.loginUseCase})
      : super(
          LoginInitialState(),
        );
  TextEditingController emailController = TextEditingController();
  TextEditingController userPasswordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  LoginUseCase loginUseCase;

  bool isVisible = true;

  void login() async {
    if (formKey.currentState!.validate() == true) {
      emit(LoginLoadingState(loadingMessage: "loading"));
      var eitherResponse = await loginUseCase.login(
          email: emailController.text, password: userPasswordController.text);
      eitherResponse.fold(
        (l) {
          emit(LoginErrorState(errorMessage: l.errorMessage));
        },
        (response) {
          emit(LoginSuccessState(loginResponseEntityModel: response));
        },
      );
    }
  }
}
