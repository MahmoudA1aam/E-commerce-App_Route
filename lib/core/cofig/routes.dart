import 'package:ecommerce/core/cofig/page_route_name.dart';


import 'package:flutter/material.dart';

import '../../presentation/auth/login/pages/login_view.dart';
import '../../presentation/auth/register/pages/register_view.dart';
import '../../presentation/splash/pages/splash_view.dart';

class Routes {
  static Route<dynamic> onGeneratedRoute(RouteSettings settings) {
    switch (settings.name) {
      case PageRouteName.initial:
        return MaterialPageRoute(
          builder: (context) => const SplashView(),
        );
      case PageRouteName.login:
        return MaterialPageRoute(
          builder: (context) => LoginView(),
        );
      case PageRouteName.register:
        return MaterialPageRoute(
          builder: (context) => RegisterView(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const SplashView(),
        );
    }
  }
}
