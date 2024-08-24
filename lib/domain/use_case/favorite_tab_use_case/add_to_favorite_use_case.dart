import 'package:dartz/dartz.dart';
import 'package:ecommerce/data/repository_imp/favorite_tab_repo_imp/favorite_tab_repo_imp.dart';
import 'package:ecommerce/domain/repository_contract/favorite_tab_repo_contract/favorite_tab_repo_contract.dart';

import '../../entitiy/failuresErrors/failures_errors.dart';
import '../../entitiy/tabs/favorite_tab_entity/add_to_favorite_entity.dart';

class AddToFavoriteUseCase {
  FavoriteTabRepoContract favoriteTabRepoContract;

  AddToFavoriteUseCase({required this.favoriteTabRepoContract});

  Future<Either<FailuresErrors, AddToFavoriteEntity>> excute(
      {required String id}) {
    return favoriteTabRepoContract.addToFavorite(id: id);
  }
}

AddToFavoriteUseCase injectAddToFavoriteUseCase() {
  return AddToFavoriteUseCase(
      favoriteTabRepoContract: injectFavoriteTabRepoImp());
}
