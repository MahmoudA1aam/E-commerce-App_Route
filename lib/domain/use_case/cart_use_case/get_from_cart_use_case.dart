import 'package:dartz/dartz.dart';
import 'package:ecommerce/data/repository_imp/cart_repo_imp/cart_repo_imp.dart';
import 'package:ecommerce/domain/entitiy/failuresErrors/failures_errors.dart';
import 'package:ecommerce/domain/entitiy/tabs/product_tab_entity/Get_Response_from_Cart_Entity.dart';
import 'package:ecommerce/domain/repository_contract/Cart_repo_contract/cart_repo_contract.dart';

class GetFromCartUseCase{
  CartRepoContract cartRepoContract;

  GetFromCartUseCase({required this.cartRepoContract});
  Future<Either<FailuresErrors,GetResponseFromCartEntity>>excute()async{
    return  await cartRepoContract.getFromCart();
  }
}
GetFromCartUseCase injectGetFromCartUseCase() {
  return GetFromCartUseCase(
      cartRepoContract: injectCartRepoImp());
}