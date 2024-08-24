import 'package:dartz/dartz.dart';
import 'package:ecommerce/data/repository_imp/cart_repo_imp/cart_data_source_imp.dart';
import 'package:ecommerce/domain/entitiy/failuresErrors/failures_errors.dart';
import 'package:ecommerce/domain/entitiy/tabs/product_tab_entity/Get_Response_from_Cart_Entity.dart';
import 'package:ecommerce/domain/repository_contract/Cart_repo_contract/cart_repo_contract.dart';

class CartRepoImp extends CartRepoContract {
  CartDataSourceImp cartDataSourceImp;

  CartRepoImp({required this.cartDataSourceImp});

  @override
  Future<Either<FailuresErrors, GetResponseFromCartEntity>>
      getFromCart() async {
    return await cartDataSourceImp.getFromCart();
  }

  @override
  Future<Either<FailuresErrors, GetResponseFromCartEntity>> deleteItemOfCart(
      {required String id}) async {
    return await cartDataSourceImp.deleteItemOfCart(id: id);
  }

  @override
  Future<Either<FailuresErrors, GetResponseFromCartEntity>> updateCountOfCart(
      {required String id, required int count}) async {
    return await cartDataSourceImp.updateCountOfCart(id: id, count: count);
  }
}

CartRepoImp injectCartRepoImp() {
  return CartRepoImp(cartDataSourceImp: injectCartDataSourceImp());
}
