import 'package:dartz/dartz.dart';

import '../../entitiy/failuresErrors/failures_errors.dart';
import '../../entitiy/tabs/home_tab_entity/CategoryOrBrandEntityModel.dart';

abstract class HomeTabRemoteDataSourceContract{
  Future<Either<FailuresErrors, CategoryOrBrandEntityModel>> getAllCategories();
  Future<Either<FailuresErrors, CategoryOrBrandEntityModel>> getAllBrands();

}