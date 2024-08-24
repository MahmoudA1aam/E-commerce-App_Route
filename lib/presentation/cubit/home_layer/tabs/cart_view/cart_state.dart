part of 'cart_cubit.dart';

abstract class CartState {}

class CartInitialState extends CartState {}

class CartSuccessState extends CartState {
  GetResponseFromCartEntity getResponseFromCartEntity;

  CartSuccessState({required this.getResponseFromCartEntity});
}

class CartLoadingState extends CartState {
  String? loadingMessage;

  CartLoadingState({this.loadingMessage});
}

class CartErrorState extends CartState {
  String? errorMessage;

  CartErrorState({this.errorMessage});
}

class DeleteItemOfCartSuccessState extends CartState {
  GetResponseFromCartEntity getResponseFromCartEntity;

  DeleteItemOfCartSuccessState({required this.getResponseFromCartEntity});
}

class DeleteItemOfCartLoadingState extends CartState {
  String? loadingMessage;

  DeleteItemOfCartLoadingState({this.loadingMessage});
}

class DeleteItemOfCartErrorState extends CartState {
  String? errorMessage;

  DeleteItemOfCartErrorState({this.errorMessage});
}

class UpdateCountOfCartSuccessState extends CartState {
  GetResponseFromCartEntity getResponseFromCartEntity;

  UpdateCountOfCartSuccessState({required this.getResponseFromCartEntity});
}

class UpdateCountOfCartLoadingState extends CartState {
  String? loadingMessage;

  UpdateCountOfCartLoadingState({this.loadingMessage});
}

class UpdateCountOfCartErrorState extends CartState {
  String? errorMessage;

  UpdateCountOfCartErrorState({this.errorMessage});
}

class ChangeCountOfCartState extends CartState {}

class AddToCartSuccessState extends CartState {
  AddToCartEntity addToCartEntity;

  AddToCartSuccessState({required this.addToCartEntity});
}

class AddToCartLoadingState extends CartState {
  String? loadingMessage;

  AddToCartLoadingState({this.loadingMessage});
}

class AddToCartErrorState extends CartState {
  String? errorMessage;

  AddToCartErrorState({this.errorMessage});
}

class FavoriteSuccessState extends CartState {
  AddToFavoriteEntity addToFavoriteResponse;

  FavoriteSuccessState({required this.addToFavoriteResponse});
}

class FavoriteErrorState extends CartState {
  String? errorMessage;

  FavoriteErrorState({this.errorMessage});
}

class FavoriteLoadingState extends CartState {
  String? loadingMessage;

  FavoriteLoadingState({this.loadingMessage});
}

class GetFromFavoriteSuccessState extends CartState {
  GetFromFavoriteEntity getFromFavoriteEntity;

  GetFromFavoriteSuccessState({required this.getFromFavoriteEntity});
}

class GetFromFavoriteErrorState extends CartState {
  String? errorMessage;

  GetFromFavoriteErrorState({this.errorMessage});
}

class GetFromFavoriteLoadingState extends CartState {
  String? loadingMessage;

  GetFromFavoriteLoadingState({this.loadingMessage});
}

class DeleteFromFavoriteSuccessState extends CartState {
  DeleteFromFavoriteEntity deleteFromFavoriteEntity;

  DeleteFromFavoriteSuccessState({required this.deleteFromFavoriteEntity});
}

class DeleteFromFavoriteErrorState extends CartState {
  String? errorMessage;

  DeleteFromFavoriteErrorState({this.errorMessage});
}

class DeleteFromFavoriteLoadingState extends CartState {
  String? loadingMessage;

  DeleteFromFavoriteLoadingState({this.loadingMessage});
}

class ChangeFavoriteSharedState extends CartState {
  ChangeFavoriteSharedState();
}
