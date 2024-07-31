import 'package:ecommerce/core/cofig/page_route_name.dart';
import 'package:ecommerce/main.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_TextField.dart';



class LoginView extends StatefulWidget {
  LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController userPasswordController = TextEditingController();

  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    var mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: theme.primaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 40
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/Route_image.png"),
              const SizedBox(
                height: 20,
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
                "User Name",
                style: theme.textTheme.bodyLarge,
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextField(
                hintText: "enter your name",
                controller: userNameController,
                validator: (value) {
                  if (value == null || value.trim.isEmpty) {
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
                "Password",
                style: theme.textTheme.bodyLarge,
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextField(
                hintText: "enter your password",
                obscureText: isVisible,
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      isVisible = !isVisible;
                    });
                  },
                  child: isVisible == true
                      ? const Icon(Icons.visibility_sharp)
                      : const Icon(Icons.visibility_off_sharp),
                ),
                controller: userPasswordController,
                validator: (value) {
                  RegExp regEax = RegExp(
                      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                  if (value == null || value.trim.isEmpty) {
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
                onPressed: () {},
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
                  navigatorKey.currentState
                      ?.pushReplacementNamed(PageRouteName.register);
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
    );
  }
}


