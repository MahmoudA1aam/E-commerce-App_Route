import 'package:ecommerce/presentation/cubit/auth/register/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../../../core/widget_helper/snackbar_widget.dart';
import '../../../../core/widgets/custom_TextField.dart';
import '../../../../domain/use_case/auth_use_case/register_use_case.dart';
import '../../../cubit/auth/register/register_state.dart';

class RegisterView extends StatefulWidget {
  RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  late RegisterCubit registerCubit;

  @override
  void initState() {
    registerCubit = RegisterCubit(registerUseCase: injectRegisterUseCase());
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    var mediaQuery = MediaQuery.of(context).size;
    return BlocListener<RegisterCubit, RegisterState>(
      bloc: registerCubit,
      listener: (context, state) {
        if (state is RegisterLoadingState) {
          EasyLoading.show(status: state.loadingMessage);
        } else if (state is RegisterErrorState) {
          EasyLoading.dismiss();
          SnackBarService.showErrorMessage(state.errorMessage!);
        } else if (state is RegisterSuccessState) {
          EasyLoading.dismiss();
          SnackBarService.showSuccessMessage(
              "${state.registerResponseModelEntity.user?.name ?? ""}\t\t\nSuccess");
        }
        // TODO: implement listener
      },
      child: Scaffold(
        backgroundColor: theme.primaryColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 40),
          child: SingleChildScrollView(
            child: Form(
              key: registerCubit.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/images/Route_image.png"),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Full Name",
                    style: theme.textTheme.bodyLarge,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomTextField(
                    hintText: "enter your full name",
                    controller: registerCubit.fullNameController,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Please enter your name";
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  Text(
                    "E-mail address",
                    style: theme.textTheme.bodyLarge,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomTextField(
                    hintText: "enter your email address",
                    controller: registerCubit.emailAddressController,
                    keyboardType: TextInputType.emailAddress,
                    suffixIcon: Icon(Icons.email_sharp),
                    validator: (value) {
                      var regexp = RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                      if (value == null || value.trim().isEmpty) {
                        return "Please enter your Email";
                      }

                      if (!regexp.hasMatch(value)) {
                        return "invalid email";
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Mobile Number",
                    style: theme.textTheme.bodyLarge,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomTextField(
                    keyboardType: TextInputType.number,
                    hintText: "enter your mobile",
                    controller: registerCubit.mobilNumberController,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Please enter your mobile";
                      } else {
                        return null;
                      }
                    },
                  ),

                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Password",
                    style: theme.textTheme.bodyLarge,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomTextField(
                    hintText: "enter your password",
                    obscureText: registerCubit.isVisible,
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          registerCubit.isVisible = !registerCubit.isVisible;
                        });
                      },
                      child: registerCubit.isVisible == true
                          ? const Icon(Icons.visibility_sharp)
                          : const Icon(Icons.visibility_off_sharp),
                    ),
                    controller: registerCubit.passwordController,
                    validator: (value) {
                      RegExp regEax = RegExp(
                          r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                      if (value == null || value.trim().isEmpty) {
                        return "Please enter your Password";
                      }

                      if (!regEax.hasMatch(value)) {
                        return "The password must include at least one lowercase letter";
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "rePassword",
                    style: theme.textTheme.bodyLarge,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomTextField(
                    hintText: "enter your rePassword",
                    obscureText: registerCubit.isVisible,
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          registerCubit.isVisible = !registerCubit.isVisible;
                        });
                      },
                      child: registerCubit.isVisible == true
                          ? const Icon(Icons.visibility_sharp)
                          : const Icon(Icons.visibility_off_sharp),
                    ),
                    controller: registerCubit.rePasswordController,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Please enter  rePassword";
                      }
                      if (value != registerCubit.passwordController.text) {
                        return "Password doesn't not match";
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 45,
                  ),
                  MaterialButton(
                    onPressed: () {
                      registerCubit.register();
                    },
                    padding: EdgeInsets.zero,
                    child: Container(
                      height: 55,
                      alignment: Alignment.center,
                      width: mediaQuery.width,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15)),
                      child: Text(
                        "Sign up",
                        style: theme.textTheme.titleMedium,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
