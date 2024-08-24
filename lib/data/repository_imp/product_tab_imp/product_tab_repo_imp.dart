import 'package:dartz/dartz.dart';
import 'package:ecommerce/data/repository_imp/product_tab_imp/product_tab_data_source_imp.dart';
import 'package:ecommerce/domain/entitiy/failuresErrors/failures_errors.dart';
import 'package:ecommerce/domain/entitiy/tabs/product_tab_entity/Add_to_cart_Entity.dart';
import 'package:ecommerce/domain/entitiy/tabs/product_tab_entity/ProductEntityModel.dart';
import 'package:ecommerce/domain/repository_contract/product_tab_repo_contract/product_tab_repo_contract.dart';

class ProductTabRepoImp extends ProductTabRepoContract {
  ProductTabDataSourceImp productTabDataSourceImp;

  ProductTabRepoImp({required this.productTabDataSourceImp});

  @override
  Future<Either<FailuresErrors, ProductEntityModel>> getAllProduct() async {
    return await productTabDataSourceImp.getAllProducts();
  }

  @override
  Future<Either<FailuresErrors, AddToCartEntity>> addToCart(
      {required String productId}) async {
    return await productTabDataSourceImp.addToCart(productId: productId);
  }
}

ProductTabRepoImp injectProductTabRepoImp() {
  return ProductTabRepoImp(
      productTabDataSourceImp: injectProductTabRemoteDataSource());
}

ProductTabRepoImp injectProductTabRepoContract() {
  return ProductTabRepoImp(
      productTabDataSourceImp: injectProductTabRemoteDataSource());
}
