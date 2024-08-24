import 'package:dartz/dartz.dart';
import 'package:ecommerce/domain/entitiy/failuresErrors/failures_errors.dart';
import 'package:ecommerce/domain/entitiy/tabs/product_tab_entity/Add_to_cart_Entity.dart';
import 'package:ecommerce/domain/repository_contract/product_tab_repo_contract/product_tab_repo_contract.dart';

import '../../../data/repository_imp/product_tab_imp/product_tab_repo_imp.dart';

class AddToCartUseCase {
  ProductTabRepoContract productTabRepoContract;

  AddToCartUseCase({required this.productTabRepoContract});

  Future<Either<FailuresErrors, AddToCartEntity>> excute(
      { required String productId}) async {
    return await productTabRepoContract.addToCart(productId: productId);
  }
}
AddToCartUseCase injectAddToCartUseCase() {
  return AddToCartUseCase(
      productTabRepoContract: injectProductTabRepoImp());
}