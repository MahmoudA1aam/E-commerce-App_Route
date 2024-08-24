import 'package:dartz/dartz.dart';
import 'package:ecommerce/data/data_source/favorite_tab_data_source/favorite_tab_api_manager.dart';
import 'package:ecommerce/domain/entitiy/failuresErrors/failures_errors.dart';
import 'package:ecommerce/domain/entitiy/tabs/favorite_tab_entity/add_to_favorite_entity.dart';
import 'package:ecommerce/domain/entitiy/tabs/favorite_tab_entity/delete_from_favorite.dart';
import 'package:ecommerce/domain/repository_contract/favorite_tab_repo_contract/favorite_tab_data_source_contract.dart';

import '../../../domain/entitiy/tabs/favorite_tab_entity/get_from_favorite.dart';

class FavoriteTabDataSourceImp implements FavoriteTabDataSourceContract {
  FavoriteTabApiManager favoriteTabApiManager;

  FavoriteTabDataSourceImp({required this.favoriteTabApiManager});

  @override
  Future<Either<FailuresErrors, AddToFavoriteEntity>> addToFavorite(
      {required String id}) async {
    var eitherResponse = await favoriteTabApiManager.addToFavorite(id: id);
    return eitherResponse.fold(
      (l) {
        return Left(FailuresErrors(errorMessage: l.errorMessage));
      },
      (response) {
        return Right(response);
      },
    );
  }

  @override
  Future<Either<FailuresErrors, GetFromFavoriteEntity>>
      getFromFavorite() async {
    var eitherResponse = await favoriteTabApiManager.getFromFavorite();
    return eitherResponse.fold(
      (l) {
        return Left(FailuresErrors(errorMessage: l.errorMessage));
      },
      (response) {
        return Right(response);
      },
    );
  }

  @override
  Future<Either<FailuresErrors, DeleteFromFavoriteEntity>> deleteFromFavorite(
      {required String id}) async {
    var eitherResponse = await favoriteTabApiManager.deleteFromFavorite(id: id);
    return eitherResponse.fold(
      (l) {
        return Left(FailuresErrors(errorMessage: l.errorMessage));
      },
      (response) {
        return Right(response);
      },
    );
  }
}

FavoriteTabDataSourceImp injectFavoriteTabDataSourceImp() {
  return FavoriteTabDataSourceImp(
      favoriteTabApiManager: FavoriteTabApiManager.getInstance());
}
