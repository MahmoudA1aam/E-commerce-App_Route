part of 'product_cubit.dart';


abstract class ProductState {}

 class ProductInitialState extends ProductState {}
 class ProductLoadingState extends ProductState {
  String? loadingMessage;

  ProductLoadingState({this.loadingMessage});

 }
 class ProductSuccessState extends ProductState {
  ProductEntityModel productEntityModel;

  ProductSuccessState(this.productEntityModel);
 }
 class ProductErrorState extends ProductState {
  String? errorMessage;

  ProductErrorState({this.errorMessage});

 }
