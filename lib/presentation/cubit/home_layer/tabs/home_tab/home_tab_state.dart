part of 'home_tab_cubit.dart';

abstract class HomeTabState {}

class HomeTabInitialState extends HomeTabState {}

class HomeTabCategoryLoadingState extends HomeTabState {
  String? loadingMessage;

  HomeTabCategoryLoadingState({this.loadingMessage});
}

class HomeTabCategorySuccessState extends HomeTabState {
  CategoryOrBrandEntityModel categoryEntityModel;

  HomeTabCategorySuccessState({required this.categoryEntityModel});
}

class HomeTabCategoryErrorState extends HomeTabState {
  String? errorMessage;

  HomeTabCategoryErrorState({this.errorMessage});
}

class HomeTabBrandLoadingState extends HomeTabState {
  String? loadingMessage;

  HomeTabBrandLoadingState({this.loadingMessage});
}

class HomeTabBrandSuccessState extends HomeTabState {
  CategoryOrBrandEntityModel brandEntityModel;

  HomeTabBrandSuccessState({required this.brandEntityModel});
}

class HomeTabBrandErrorState extends HomeTabState {
  String? errorMessage;

  HomeTabBrandErrorState({this.errorMessage});
}
