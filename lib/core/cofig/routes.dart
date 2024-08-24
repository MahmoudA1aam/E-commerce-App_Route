import 'package:ecommerce/core/cofig/page_route_name.dart';
import 'package:ecommerce/domain/entitiy/tabs/product_tab_entity/ProductEntityModel.dart';
import 'package:ecommerce/presentation/pages/home/home_layer.dart';
import 'package:ecommerce/presentation/pages/home/tabs/product_tab/cart_view/cart_view.dart';
import 'package:ecommerce/presentation/pages/home/tabs/product_tab/product_details_view/product_details_view.dart';

import 'package:flutter/material.dart';

import '../../presentation/pages/auth/login/login_view.dart';
import '../../presentation/pages/auth/register/register_view.dart';
import '../../presentation/pages/splash/splash_view.dart';
import '../data_model/product_details_model.dart';

class Routes {
  static Route<dynamic> onGeneratedRoute(RouteSettings settings) {
    final arguments = settings.arguments;
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
      case PageRouteName.homeLayer:
        return MaterialPageRoute(
          builder: (context) => HomeLayer(),
        );
      case PageRouteName.productDetails:
        return MaterialPageRoute(
          builder: (context) => ProductDetailsView(
            args: arguments as ProductDetailsModel,
          ),
        );
      case PageRouteName.cartView:
        return MaterialPageRoute(
          builder: (context) => CartView(),
        );

      default:
        return MaterialPageRoute(
          builder: (context) => const SplashView(),
        );
    }
  }
}
