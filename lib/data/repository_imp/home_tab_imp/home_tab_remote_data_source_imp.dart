import 'package:dartz/dartz.dart';
import 'package:ecommerce/data/data_source/home_tap_data_source/home_tab_api_manager.dart';
import 'package:ecommerce/domain/repository_contract/home_tabe_repostitory_contract/home_tab_remote_data_source_contract.dart';

import '../../../domain/entitiy/failuresErrors/failures_errors.dart';
import '../../../domain/entitiy/tabs/home_tab_entity/CategoryOrBrandEntityModel.dart';

class HomeTabRemoteDataSourceImp extends HomeTabRemoteDataSourceContract {
  HomeTabRemoteDataSourceImp({required this.homeTabApiManager});

  HomeTabApiManager homeTabApiManager;

  @override
  Future<Either<FailuresErrors, CategoryOrBrandEntityModel>>
      getAllCategories() async {
    var eitherResponse = await homeTabApiManager.getAllCategory();
    return eitherResponse.fold(
      (l) {
        return left(FailuresErrors(errorMessage: l.errorMessage));
      },
      (response) {
        return Right(response.toCategoryOrBrandEntityModel());
      },
    );
  }

  @override
  Future<Either<FailuresErrors, CategoryOrBrandEntityModel>>
      getAllBrands() async {
    var eitherResponse = await homeTabApiManager.getAllBrands();
    return eitherResponse.fold(
      (l) {
        return Left(FailuresErrors(errorMessage: l.errorMessage));
      },
      (response) {
        return Right(response.toCategoryOrBrandEntityModel());
      },
    );
  }
}

HomeTabRemoteDataSourceImp injectHomeTabRemoteDataSource() {
  return HomeTabRemoteDataSourceImp(
      homeTabApiManager: HomeTabApiManager.getInstance());
}
