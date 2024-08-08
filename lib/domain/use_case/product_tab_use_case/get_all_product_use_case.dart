import 'package:dartz/dartz.dart';
import 'package:ecommerce/data/repository_imp/product_tab_imp/product_tab_repo_imp.dart';
import 'package:ecommerce/domain/entitiy/failuresErrors/failures_errors.dart';
import 'package:ecommerce/domain/entitiy/tabs/product_tab_entity/ProductEntityModel.dart';
import 'package:ecommerce/domain/repository_contract/product_tab_repo_contract/product_tab_repo_contract.dart';

class GetAllProductUseCase {
  ProductTabRepoContract productTabRepoContract;

  GetAllProductUseCase({required this.productTabRepoContract});

  Future<Either<FailuresErrors, ProductEntityModel>> excute() async{
    return await productTabRepoContract.getAllProduct();
  }
}

GetAllProductUseCase injectGetAllProductUseCase() {
  return GetAllProductUseCase(
      productTabRepoContract: injectProductTabRepoImp());
}
