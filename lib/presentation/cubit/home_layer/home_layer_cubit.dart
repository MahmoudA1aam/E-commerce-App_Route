import 'package:bloc/bloc.dart';
import 'package:ecommerce/presentation/pages/home/tabs/product_tab/product_tab.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../pages/home/tabs/account_tab/account_tab.dart';
import '../../pages/home/tabs/favorite_tab/favourite_tab.dart';
import '../../pages/home/tabs/home_tab/home_tab.dart';

part 'home_layer_state.dart';

class HomeLayerCubit extends Cubit<HomeLayerState> {
  HomeLayerCubit() : super(HomeLayerInitialState());
  int selectedIndex =1 ;
  List<Widget> screens = [HomeTab(), ProductTab(), FavoriteTab(), AccountTab()];

  changeIndex(int index) {
    emit(HomeLayerInitialState());

    selectedIndex = index;
    emit(HomeLayerChangeIndexState());
  }
}
