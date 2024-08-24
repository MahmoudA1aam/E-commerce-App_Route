import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/cofig/page_route_name.dart';
import '../../../core/widget_helper/shared_preference.dart';
import '../../../main.dart';
import '../../cubit/home_layer/tabs/cart_view/cart_cubit.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {


  @override
  void initState() {
    Timer(const Duration(seconds: 2), () async {
      await SharedPreferenceUtils.init();
      var userToken = SharedPreferenceUtils.getDate(key: "Token");
      String route;
      if (userToken == null) {
        Navigator.of(context).pushReplacementNamed(PageRouteName.login);
      } else {
        Navigator.pushReplacementNamed(context, PageRouteName.homeLayer);
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Image.asset(
      "assets/images/Splash_Screen.png",
      width: mediaQuery.width,
      height: mediaQuery.height,
      fit: BoxFit.fill,
    );
  }
}
