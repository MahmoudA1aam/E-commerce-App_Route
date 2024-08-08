import 'package:dartz/dartz.dart';
import 'package:ecommerce/domain/entitiy/failuresErrors/failures_errors.dart';
import 'package:ecommerce/domain/entitiy/tabs/product_tab_entity/ProductEntityModel.dart';

abstract class ProductTabRepoContract {
  Future<Either<FailuresErrors, ProductEntityModel>> getAllProduct();
}
