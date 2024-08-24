import 'package:dartz/dartz.dart';

import '../../../data/repository_imp/cart_repo_imp/cart_repo_imp.dart';
import '../../entitiy/failuresErrors/failures_errors.dart';
import '../../entitiy/tabs/product_tab_entity/Get_Response_from_Cart_Entity.dart';
import '../../repository_contract/Cart_repo_contract/cart_repo_contract.dart';

class UpdateCountOfCartUseCase {
  CartRepoContract cartRepoContract;

  UpdateCountOfCartUseCase({required this.cartRepoContract});

  Future<Either<FailuresErrors, GetResponseFromCartEntity>> excute(
      {required String id, required int count}) async {
    return await cartRepoContract.updateCountOfCart(id: id, count: count);
  }
}

UpdateCountOfCartUseCase injectUpdateCountOfCartUseCase() {
  return UpdateCountOfCartUseCase(cartRepoContract: injectCartRepoImp());
}
