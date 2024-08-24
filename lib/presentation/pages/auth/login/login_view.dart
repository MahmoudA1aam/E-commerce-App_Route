import 'package:ecommerce/core/cofig/page_route_name.dart';
import 'package:ecommerce/core/widget_helper/shared_preference.dart';
import 'package:ecommerce/main.dart';
import 'package:ecommerce/presentation/cubit/auth/login/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../../../core/widget_helper/snackbar_widget.dart';
import '../../../../core/widgets/custom_TextField.dart';
import '../../../../domain/use_case/auth_use_case/login_use_case.dart';

class LoginView extends StatefulWidget {
  LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late LoginCubit loginCubit;

  @override
  void initState() {
    loginCubit = LoginCubit(loginUseCase: injectLoginUseCase());
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    var mediaQuery = MediaQuery.of(context).size;
    return BlocListener<LoginCubit, LoginState>(
      bloc: loginCubit,
      listener: (context, state) {
        if (state is LoginLoadingState) {
          EasyLoading.show(status: state.loadingMessage);
        } else if (state is LoginErrorState) {
          EasyLoading.dismiss();
          SnackBarService.showErrorMessage(state.errorMessage!);
        } else if (state is LoginSuccessState) {
          EasyLoading.dismiss();
          SnackBarService.showSuccessMessage(
              "${state.loginResponseEntityModel.user?.name ?? ""}\t\t\nSuccess");

          SharedPreferenceUtils.saveDate(
              key: "Token", value: state.loginResponseEntityModel.token);
          Navigator.pushReplacementNamed(context, PageRouteName.homeLayer);
        }

        // TODO: implement listener
      },
      child: Scaffold(
        backgroundColor: theme.primaryColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 40),
          child: SingleChildScrollView(
            child: Form(
              key: loginCubit.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/images/Route_image.png"),
                  const SizedBox(
                    height: 50,
                  ),
                  Text(
                    "Welcome Back To Route",
                    style: theme.textTheme.titleLarge,
                  ),
                  Text(
                    "Please sign in with your mail",
                    style: theme.textTheme.bodySmall,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "email",
                    style: theme.textTheme.bodyLarge,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomTextField(
                    hintText: "enter your email",
                    controller: loginCubit.emailController,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Please enter your email";
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
                    obscureText: loginCubit.isVisible,
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          loginCubit.isVisible = !loginCubit.isVisible;
                        });
                      },
                      child: loginCubit.isVisible == true
                          ? const Icon(Icons.visibility_sharp)
                          : const Icon(Icons.visibility_off_sharp),
                    ),
                    controller: loginCubit.userPasswordController,
                    validator: (value) {
                      RegExp regEax = RegExp(
                          r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                      if (value == null || value.trim().isEmpty) {
                        return "Please enter your name";
                      }

                      if (!regEax.hasMatch(value)) {
                        return "The password must include at least one lowercase letter";
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Forgot password",
                    style: theme.textTheme.bodyMedium,
                    textAlign: TextAlign.end,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  MaterialButton(
                    onPressed: () {
                      loginCubit.login();
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
                        "Login",
                        style: theme.textTheme.titleMedium,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, PageRouteName.register);
                    },
                    child: Text(
                      "Don’t have an account? Create Account",
                      textAlign: TextAlign.center,
                      style: theme.textTheme.bodyMedium,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
