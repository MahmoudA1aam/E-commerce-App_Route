
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../cubit/home_layer/home_layer_cubit.dart';
import '../../widgets/home_widget/cutom_bottomNavigationBar.dart';

class HomeLayer extends StatelessWidget {
  HomeLayer({super.key});

  HomeLayerCubit homeLayerCubit = HomeLayerCubit();

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return BlocBuilder<HomeLayerCubit, HomeLayerState>(
      bloc: homeLayerCubit,
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            toolbarHeight: 50.h,
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: SvgPicture.asset(
              "assets/images/image_route_header.svg",
              color: theme.primaryColor,
            ),
            centerTitle: false,
          ),
          bottomNavigationBar: CustomBottomNavigationBar(
            context: context,
            selectedIndex: homeLayerCubit.selectedIndex,
            onTapFunction: (index) {
              homeLayerCubit.changeIndex(index);
            },
          ),
          body: homeLayerCubit.screens[homeLayerCubit.selectedIndex],
        );
      },
    );
  }
}
