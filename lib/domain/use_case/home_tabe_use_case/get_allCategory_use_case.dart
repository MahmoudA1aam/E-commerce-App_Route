import 'package:dartz/dartz.dart';
import 'package:ecommerce/data/repository_imp/home_tab_imp/home_tab_remote_data_source_imp.dart';
import 'package:ecommerce/data/repository_imp/home_tab_imp/home_tab_repo_imp.dart';
import 'package:ecommerce/domain/repository_contract/home_tabe_repostitory_contract/home_tab_remote_data_source_contract.dart';
import 'package:ecommerce/domain/repository_contract/home_tabe_repostitory_contract/home_tab_repository_contract.dart';

import '../../entitiy/failuresErrors/failures_errors.dart';
import '../../entitiy/tabs/home_tab_entity/CategoryOrBrandEntityModel.dart';

class GetAllCategoryUseCase {
  GetAllCategoryUseCase({required this.homeTabRepositoryContract});

  HomeTabRepositoryContract homeTabRepositoryContract;

  Future<Either<FailuresErrors, CategoryOrBrandEntityModel>> excute() {
    return homeTabRepositoryContract.getAllCategories();
  }
}
GetAllCategoryUseCase injectHomeTabUseCase(){
  return GetAllCategoryUseCase(homeTabRepositoryContract: injectHomeRepoContract());
  
}