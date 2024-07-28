import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitialState());
  bool isVisible = false;
  GlobalKey<FormState>  formKey=GlobalKey<FormState>();

  TextEditingController fullNameController = TextEditingController();

  TextEditingController mobilNumberController = TextEditingController();

  TextEditingController emailAddressController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
void register(){

}
  
}
