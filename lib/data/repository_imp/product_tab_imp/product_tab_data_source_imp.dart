import 'package:dartz/dartz.dart';
import 'package:ecommerce/domain/entitiy/tabs/product_tab_entity/Add_to_cart_Entity.dart';

import '../../../domain/entitiy/failuresErrors/failures_errors.dart';
import '../../../domain/entitiy/tabs/product_tab_entity/ProductEntityModel.dart';
import '../../../domain/repository_contract/product_tab_repo_contract/product_tab_data_source_contract.dart';
import '../../data_source/product_tab_data_souce/product_tab_api_manager.dart';

class ProductTabDataSourceImp extends ProductTabDataSourceContract {
  ProductTabApiManager productTabApiManager;

  ProductTabDataSourceImp({required this.productTabApiManager});

  @override
  Future<Either<FailuresErrors, ProductEntityModel>> getAllProducts() async {
    var eitherResponse = await productTabApiManager.getAllProducts();
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
  Future<Either<FailuresErrors, AddToCartEntity>> addToCart(
      {required String productId}) async {
    var eitherResponse =
        await productTabApiManager.addToCart(productId: productId);
    return eitherResponse.fold(
      (l) {
        return Left(FailuresErrors(errorMessage: l.errorMessage));
      },
      (response) {
        return Right(response);
      },
    );
  }
}

ProductTabDataSourceImp injectProductTabRemoteDataSource() {
  return ProductTabDataSourceImp(
      productTabApiManager: ProductTabApiManager.getInstance());
}
