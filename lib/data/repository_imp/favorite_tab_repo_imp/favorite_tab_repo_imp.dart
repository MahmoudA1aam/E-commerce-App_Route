import 'package:dartz/dartz.dart';
import 'package:ecommerce/data/repository_imp/favorite_tab_repo_imp/favorite_tab_data_source_imp.dart';
import 'package:ecommerce/domain/entitiy/failuresErrors/failures_errors.dart';
import 'package:ecommerce/domain/entitiy/tabs/favorite_tab_entity/add_to_favorite_entity.dart';
import 'package:ecommerce/domain/entitiy/tabs/favorite_tab_entity/delete_from_favorite.dart';
import 'package:ecommerce/domain/entitiy/tabs/favorite_tab_entity/get_from_favorite.dart';
import 'package:ecommerce/domain/repository_contract/favorite_tab_repo_contract/favorite_tab_repo_contract.dart';

class FavoriteTabRepoImp implements FavoriteTabRepoContract {
  FavoriteTabDataSourceImp favoriteTabDataSourceImp;

  FavoriteTabRepoImp({required this.favoriteTabDataSourceImp});

  @override
  Future<Either<FailuresErrors, AddToFavoriteEntity>> addToFavorite(
      {required String id}) async {
    return await favoriteTabDataSourceImp.addToFavorite(id: id);
  }

  @override
  Future<Either<FailuresErrors, GetFromFavoriteEntity>>
      getFromFavorite() async {
    return await favoriteTabDataSourceImp.getFromFavorite();
  }

  @override
  Future<Either<FailuresErrors, DeleteFromFavoriteEntity>> deleteFromFavorite(
      {required String id}) async {
    return await favoriteTabDataSourceImp.deleteFromFavorite(id: id);
  }
}

FavoriteTabRepoImp injectFavoriteTabRepoImp() {
  return FavoriteTabRepoImp(
      favoriteTabDataSourceImp: injectFavoriteTabDataSourceImp());
}
