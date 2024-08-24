import 'package:dartz/dartz.dart';
import 'package:ecommerce/domain/entitiy/failuresErrors/failures_errors.dart';
import 'package:ecommerce/domain/entitiy/tabs/product_tab_entity/Get_Response_from_Cart_Entity.dart';
import 'package:ecommerce/domain/repository_contract/Cart_repo_contract/cart_repo_contract.dart';

import '../../../data/repository_imp/cart_repo_imp/cart_repo_imp.dart';

class DeleteItemOfCartUseCase {
  CartRepoContract cartRepoContract;

  DeleteItemOfCartUseCase({required this.cartRepoContract});

  Future<Either<FailuresErrors, GetResponseFromCartEntity>> excute(
      {required String id}) async {
    return await cartRepoContract.deleteItemOfCart(id: id);
  }
}

DeleteItemOfCartUseCase injectDeleteItemOfCartUseCase() {
  return DeleteItemOfCartUseCase(cartRepoContract: injectCartRepoImp());
}
