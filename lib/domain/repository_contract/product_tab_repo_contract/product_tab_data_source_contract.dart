import 'package:dartz/dartz.dart';
import 'package:ecommerce/domain/entitiy/failuresErrors/failures_errors.dart';
import 'package:ecommerce/domain/entitiy/tabs/product_tab_entity/Add_to_cart_Entity.dart';
import 'package:ecommerce/domain/entitiy/tabs/product_tab_entity/ProductEntityModel.dart';

abstract class ProductTabDataSourceContract {
  Future<Either<FailuresErrors, ProductEntityModel>> getAllProducts();

  Future<Either<FailuresErrors, AddToCartEntity>> addToCart({ required String productId});
}
