import 'package:dartz/dartz.dart';
import 'package:ecommerce/domain/entitiy/failuresErrors/failures_errors.dart';
import 'package:ecommerce/domain/entitiy/tabs/product_tab_entity/ProductEntityModel.dart';

import '../../entitiy/tabs/product_tab_entity/Add_to_cart_Entity.dart';

abstract class ProductTabRepoContract {
  Future<Either<FailuresErrors, ProductEntityModel>> getAllProduct();

  Future<Either<FailuresErrors, AddToCartEntity>> addToCart({required String productId});
}
