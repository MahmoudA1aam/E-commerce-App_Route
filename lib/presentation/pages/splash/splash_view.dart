import 'dart:async';

import 'package:flutter/material.dart';

import '../../../core/cofig/page_route_name.dart';
import '../../../main.dart';


class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context,PageRouteName.homeLayer);
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Image.asset(
      "assets/images/Splash_Screen.png",
      width: mediaQuery.width,
      height: mediaQuery.height,
      fit: BoxFit.cover,
    );
  }
}
