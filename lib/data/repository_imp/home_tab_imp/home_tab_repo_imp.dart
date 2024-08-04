import 'package:dartz/dartz.dart';
import 'package:ecommerce/data/repository_imp/home_tab_imp/home_tab_remote_data_source_imp.dart';
import 'package:ecommerce/domain/repository_contract/home_tabe_repostitory_contract/home_tab_repository_contract.dart';

import '../../../domain/entitiy/failuresErrors/failures_errors.dart';
import '../../../domain/entitiy/tabs/home_tab_entity/CategoryOrBrandEntityModel.dart';

class HomeTabRepoImp extends HomeTabRepositoryContract {
  HomeTabRemoteDataSourceImp homeTabRemoteDataSourceImp;

  HomeTabRepoImp({required this.homeTabRemoteDataSourceImp});

  @override
  Future<Either<FailuresErrors, CategoryOrBrandEntityModel>>
      getAllCategories() async {
    return await homeTabRemoteDataSourceImp.getAllCategories();
    // TODO: implement getAllCategories
    throw UnimplementedError();
  }

  @override
  Future<Either<FailuresErrors, CategoryOrBrandEntityModel>>
      getAllBrands() async {
    return await homeTabRemoteDataSourceImp.getAllBrands();
    throw UnimplementedError();
  }
}

HomeTabRepoImp injectHomeRepoContract() {
  return HomeTabRepoImp(
      homeTabRemoteDataSourceImp: injectHomeTabRemoteDataSource());
}
