import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce/domain/entitiy/tabs/product_tab_entity/Add_to_cart_Entity.dart';
import 'package:ecommerce/domain/entitiy/tabs/product_tab_entity/ProductEntityModel.dart';
import 'package:ecommerce/domain/use_case/cart_use_case/add_to_cart_use_case.dart';
import 'package:ecommerce/domain/use_case/product_tab_use_case/get_all_product_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit(
      {required this.getAllProductUseCase, required this.addToCartUseCase})
      : super(ProductInitialState());
  GetAllProductUseCase getAllProductUseCase;
  AddToCartUseCase addToCartUseCase;

  List<ProductDataEntity>? listOfProduct;
  int numOfCartItem = 0;

  static ProductCubit get(context) => BlocProvider.of(context);

  void getAllProduct() async {
    emit(ProductLoadingState(loadingMessage: "Loading.."));
    print("loading");
    var eitherResponse = await getAllProductUseCase.excute();
    return eitherResponse.fold(
      (l) {
        emit(ProductErrorState(errorMessage: l.errorMessage));
      },
      (response) {
        listOfProduct = response.data ?? [];
        emit(ProductSuccessState(response));
      },
    );
  }
}
