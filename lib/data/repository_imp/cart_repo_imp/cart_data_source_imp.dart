import 'package:dartz/dartz.dart';
import 'package:ecommerce/data/data_source/cart_data_source/cart_api_manager.dart';
import 'package:ecommerce/domain/entitiy/failuresErrors/failures_errors.dart';
import 'package:ecommerce/domain/entitiy/tabs/product_tab_entity/Get_Response_from_Cart_Entity.dart';
import 'package:ecommerce/domain/repository_contract/Cart_repo_contract/cart_data_source_contract.dart';

class CartDataSourceImp extends CartDataSourceContract {
  CartApiManager cartApiManager;

  CartDataSourceImp({required this.cartApiManager});

  @override
  Future<Either<FailuresErrors, GetResponseFromCartEntity>>
      getFromCart() async {
    var eitherResponse = await cartApiManager.getFromCart();
    return eitherResponse.fold(
      (l) {
        return Left(FailuresErrors(errorMessage: l.errorMessage));
      },
      (response) {
        return Right(response);
      },
    );
  }

  @override
  Future<Either<FailuresErrors, GetResponseFromCartEntity>> deleteItemOfCart(
      {required String id}) async {
    var eitherResponse = await cartApiManager.deleteItemOfCart(id: id);
    return eitherResponse.fold(
      (l) {
        return left(FailuresErrors(errorMessage: l.errorMessage));
      },
      (response) {
        return Right(response);
      },
    );
  }

  @override
  Future<Either<FailuresErrors, GetResponseFromCartEntity>> updateCountOfCart(
      {required String id, required int count}) async {
    var eitherResponse =
        await cartApiManager.updateCountOfCart(id: id, count: count);
    return eitherResponse.fold(
      (l) {
        return left(FailuresErrors(errorMessage: l.errorMessage));
      },
      (response) {
        return Right(response);
      },
    );
  }
}

CartDataSourceImp injectCartDataSourceImp() {
  return CartDataSourceImp(cartApiManager: CartApiManager.getInstance());
}
