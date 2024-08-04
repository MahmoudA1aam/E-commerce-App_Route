import 'package:dartz/dartz.dart';
import 'package:ecommerce/domain/entitiy/failuresErrors/failures_errors.dart';
import 'package:ecommerce/domain/entitiy/tabs/home_tab_entity/CategoryOrBrandEntityModel.dart';

abstract class HomeTabRepositoryContract {
  Future<Either<FailuresErrors, CategoryOrBrandEntityModel>> getAllCategories();
  Future<Either<FailuresErrors, CategoryOrBrandEntityModel>> getAllBrands();
}
