import 'package:dartz/dartz.dart';
import 'package:ecommerce/data/repository_imp/home_tab_imp/home_tab_repo_imp.dart';
import 'package:ecommerce/domain/entitiy/failuresErrors/failures_errors.dart';
import 'package:ecommerce/domain/entitiy/tabs/home_tab_entity/CategoryOrBrandEntityModel.dart';
import 'package:ecommerce/domain/repository_contract/home_tabe_repostitory_contract/home_tab_repository_contract.dart';

class GetAllBrandUseCase {
  GetAllBrandUseCase({required this.homeTabRepositoryContract});

  HomeTabRepositoryContract homeTabRepositoryContract;

  Future<Either<FailuresErrors, CategoryOrBrandEntityModel>> excute() {
    return homeTabRepositoryContract.getAllBrands();
  }
}

GetAllBrandUseCase injectGetAllBrandUseCase() {
  return GetAllBrandUseCase(
      homeTabRepositoryContract: injectHomeRepoContract());
}
