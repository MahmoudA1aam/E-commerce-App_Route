import 'package:bloc/bloc.dart';
import 'package:ecommerce/domain/use_case/auth_use_case/register_use_case.dart';
import 'package:ecommerce/presentation/cubit/auth/register/register_state.dart';

import 'package:flutter/material.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit({required this.registerUseCase})
      : super(RegisterInitialState());
  bool isVisible = true;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController fullNameController = TextEditingController();

  TextEditingController mobilNumberController = TextEditingController();

  TextEditingController emailAddressController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();
  RegisterUseCase registerUseCase;

  void register() async {
    if (formKey.currentState!.validate() == true) {
      emit(RegisterLoadingState(loadingMessage: "Loading.."));
      var eitherResponse = await registerUseCase.register(
          fullNameController.text,
          emailAddressController.text,
          passwordController.text,
          rePasswordController.text,
          mobilNumberController.text);
      eitherResponse.fold(
        (l) {
          emit(RegisterErrorState(errorMessage: l.errorMessage));
        },
        (response) {
          emit(RegisterSuccessState(registerResponseModelEntity: response));
        },
      );
    }
  }
}
