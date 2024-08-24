import 'package:dartz/dartz.dart';
import 'package:ecommerce/domain/entitiy/failuresErrors/failures_errors.dart';
import 'package:ecommerce/domain/entitiy/tabs/favorite_tab_entity/get_from_favorite.dart';
import 'package:ecommerce/domain/repository_contract/favorite_tab_repo_contract/favorite_tab_repo_contract.dart';

import '../../../data/repository_imp/favorite_tab_repo_imp/favorite_tab_repo_imp.dart';

class GetFromFavoriteUseCase {
  FavoriteTabRepoContract favoriteTabRepoContract;

  GetFromFavoriteUseCase({required this.favoriteTabRepoContract});

  Future<Either<FailuresErrors, GetFromFavoriteEntity>> excute() async {
    return await favoriteTabRepoContract.getFromFavorite();
  }
}

GetFromFavoriteUseCase injectGetFromFavoriteUseCase() {
  return GetFromFavoriteUseCase(
      favoriteTabRepoContract: injectFavoriteTabRepoImp());
}
