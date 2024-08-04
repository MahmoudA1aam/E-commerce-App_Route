import 'package:bot_toast/bot_toast.dart';
import 'package:ecommerce/core/application_theme/application_theme.dart';
import 'package:ecommerce/core/cofig/routes.dart';
import 'package:ecommerce/core/widget_helper/myBlocObserver.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/cofig/page_route_name.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ApplicationTheme.appTheme,
          title: "E_Commerce",
          initialRoute: PageRouteName.initial,
          onGenerateRoute: Routes.onGeneratedRoute,
          navigatorKey: navigatorKey,
          builder: EasyLoading.init(builder: BotToastInit()),
        );
      },
    );
  }
}
