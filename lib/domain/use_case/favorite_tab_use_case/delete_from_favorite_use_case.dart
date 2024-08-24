import 'package:dartz/dartz.dart';
import 'package:ecommerce/data/repository_imp/favorite_tab_repo_imp/favorite_tab_repo_imp.dart';
import 'package:ecommerce/domain/repository_contract/favorite_tab_repo_contract/favorite_tab_repo_contract.dart';

import '../../entitiy/failuresErrors/failures_errors.dart';
import '../../entitiy/tabs/favorite_tab_entity/delete_from_favorite.dart';

class DeleteFromFavoriteUseCase {
  FavoriteTabRepoContract favoriteTabRepoContract;

  DeleteFromFavoriteUseCase({required this.favoriteTabRepoContract});

  Future<Either<FailuresErrors, DeleteFromFavoriteEntity>> excute(
      {required String id}) async {
    return await favoriteTabRepoContract.deleteFromFavorite(id: id);
  }
}

DeleteFromFavoriteUseCase injectDeleteFromFavoriteUseCase() {
  return DeleteFromFavoriteUseCase(
      favoriteTabRepoContract: injectFavoriteTabRepoImp());
}
