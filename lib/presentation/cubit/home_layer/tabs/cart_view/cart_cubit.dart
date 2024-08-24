import 'package:bloc/bloc.dart';
import 'package:ecommerce/domain/entitiy/tabs/product_tab_entity/Get_Response_from_Cart_Entity.dart';
import 'package:ecommerce/domain/use_case/cart_use_case/add_to_cart_use_case.dart';
import 'package:ecommerce/domain/use_case/cart_use_case/delete_item_of_cart.dart';
import 'package:ecommerce/domain/use_case/cart_use_case/get_from_cart_use_case.dart';
import 'package:ecommerce/domain/use_case/cart_use_case/update_count_of_cart.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../domain/entitiy/tabs/favorite_tab_entity/add_to_favorite_entity.dart';
import '../../../../../domain/entitiy/tabs/favorite_tab_entity/delete_from_favorite.dart';
import '../../../../../domain/entitiy/tabs/favorite_tab_entity/get_from_favorite.dart';
import '../../../../../domain/entitiy/tabs/product_tab_entity/Add_to_cart_Entity.dart';
import '../../../../../domain/entitiy/tabs/product_tab_entity/ProductEntityModel.dart';
import '../../../../../domain/use_case/favorite_tab_use_case/add_to_favorite_use_case.dart';
import '../../../../../domain/use_case/favorite_tab_use_case/delete_from_favorite_use_case.dart';
import '../../../../../domain/use_case/favorite_tab_use_case/get_from_favorite_use_case.dart';

part 'cart_state.dart';

class Cart_FavoriteCubit extends Cubit<CartState> {
  Cart_FavoriteCubit(
      {required this.getFromCartUseCase,
      required this.deleteItemOfCartUseCase,
      required this.updateCountOfCartUseCase,
      required this.addToCartUseCase,
      this.addToFavoriteUseCase,
      this.getFromFavoriteUseCase,
      this.deleteFromFavoriteUseCase})
      : super(CartInitialState());
  GetFromCartUseCase getFromCartUseCase;
  DeleteItemOfCartUseCase deleteItemOfCartUseCase;
  UpdateCountOfCartUseCase updateCountOfCartUseCase;
  AddToCartUseCase addToCartUseCase;
  List<GetProductsResponseCartEntity> productList = [];
  AddToFavoriteUseCase? addToFavoriteUseCase;
  GetFromFavoriteUseCase? getFromFavoriteUseCase;
  DeleteFromFavoriteUseCase? deleteFromFavoriteUseCase;
  List<GetDataFromFavoriteEntity> favoriteList = [];

  int? totalPrice = 0;
  int? numOfCartItem = 0;

  static Cart_FavoriteCubit get(context) => BlocProvider.of(context);

  void getFromCart() async {
    emit(CartLoadingState(loadingMessage: "Loading.."));
    var eitherResponse = await getFromCartUseCase.excute();
    return eitherResponse.fold(
      (l) {
        emit(CartErrorState(errorMessage: l.errorMessage));
      },
      (response) {
        numOfCartItem = response.numOfCartItems ?? 0;
        totalPrice = response.data?.totalCartPrice;
        productList = response.data?.products ?? [];

        emit(CartSuccessState(getResponseFromCartEntity: response));
      },
    );
  }

  void deleteItemOfCart({required String id}) async {
    emit(DeleteItemOfCartLoadingState(loadingMessage: "loading..."));
    var eitherResponse = await deleteItemOfCartUseCase.excute(id: id);

    return eitherResponse.fold(
      (l) {
        emit(DeleteItemOfCartErrorState(errorMessage: l.errorMessage));
      },
      (response) {

        totalPrice = response.data?.totalCartPrice;
        productList = response.data?.products ?? [];
        numOfCartItem = response.numOfCartItems ?? 0;
        emit(DeleteItemOfCartSuccessState(getResponseFromCartEntity: response));
      },
    );
  }

  void updatePlusCount({required String id, required int count}) async {
    emit(UpdateCountOfCartLoadingState(loadingMessage: "loading..."));
    count++;
    var eitherResponse =
        await updateCountOfCartUseCase.excute(id: id, count: count);
    return eitherResponse.fold(
      (l) {
        emit(UpdateCountOfCartErrorState(errorMessage: l.errorMessage));
      },
      (response) {
        totalPrice = response.data?.totalCartPrice;
        productList = response.data?.products ?? [];
        numOfCartItem = response.numOfCartItems ?? 0;
        emit(
            UpdateCountOfCartSuccessState(getResponseFromCartEntity: response));
      },
    );
  }

  void updateMinisCount({required String id, required int count}) async {
    emit(UpdateCountOfCartLoadingState(loadingMessage: "loading..."));
    count--;

    if (count <= 0) {
      return deleteItemOfCart(id: id);
    } else {
      var eitherResponse =
          await updateCountOfCartUseCase.excute(id: id, count: count);

      return eitherResponse.fold(
        (l) {
          emit(UpdateCountOfCartErrorState(errorMessage: l.errorMessage));
        },
        (response) {
          totalPrice = response.data?.totalCartPrice;
          productList = response.data?.products ?? [];
          numOfCartItem = response.numOfCartItems ?? 0;
          emit(UpdateCountOfCartSuccessState(
              getResponseFromCartEntity: response));
        },
      );
    }
  }

  void addToCart({required String productId}) async {
    emit(AddToCartLoadingState(loadingMessage: "Loading..."));

    var eitherResponse = await addToCartUseCase.excute(productId: productId);
    var eitherGetResponse = await getFromCartUseCase.excute();
    eitherGetResponse.forEach(
      (r) {
        productList = r.data?.products ?? [];

        numOfCartItem = r.numOfCartItems ?? 0;
      },
    );

    return eitherResponse.fold(
      (l) {
        emit(AddToCartErrorState(errorMessage: l.errorMessage));
      },
      (response) {
        emit(AddToCartSuccessState(addToCartEntity: response));
      },
    );
  }

  void addToFavorite({required String id}) async {
    emit(FavoriteLoadingState(loadingMessage: "loading.."));
    var eitherResponse = await addToFavoriteUseCase?.excute(id: id);
    var eitherGetResponse = await getFromFavoriteUseCase?.excute();
    eitherGetResponse?.forEach(
      (r) {
        favoriteList = r.data ?? [];
      },
    );
    return eitherResponse?.fold(
      (l) {
        emit(FavoriteErrorState(errorMessage: l.errorMessage));
      },
      (response) {
        emit(FavoriteSuccessState(addToFavoriteResponse: response));
      },
    );
  }

  void getFromFavorite() async {
    emit(GetFromFavoriteLoadingState(loadingMessage: "Loading..."));
    var eitherResponse = await getFromFavoriteUseCase?.excute();
    return eitherResponse?.fold(
      (l) {
        emit(GetFromFavoriteErrorState(errorMessage: l.errorMessage));
      },
      (response) {
        favoriteList = response.data ?? [];
        emit(GetFromFavoriteSuccessState(getFromFavoriteEntity: response));
      },
    );
  }

  void deleteFromFavorite({required String id}) async {
    emit(DeleteFromFavoriteLoadingState(loadingMessage: "Loading.."));
    var eitherResponse = await deleteFromFavoriteUseCase?.excute(id: id);

    var eitherGetResponse = await getFromFavoriteUseCase?.excute();
    eitherGetResponse?.forEach(
      (r) {
        favoriteList = r.data ?? [];
      },
    );
    return eitherResponse?.fold(
      (l) {
        emit(DeleteFromFavoriteErrorState(errorMessage: l.errorMessage));
      },
      (response) async {
        emit(
            DeleteFromFavoriteSuccessState(deleteFromFavoriteEntity: response));
      },
    );
  }

  bool isInCart(
    ProductDataEntity product,
  ) {
    if (productList.isNotEmpty) {
      for (int i = 0; i < productList.length; i++) {
        if (product.id == productList[i].id) {
          return true;
        }
      }
    }
    return false;
  }
}
