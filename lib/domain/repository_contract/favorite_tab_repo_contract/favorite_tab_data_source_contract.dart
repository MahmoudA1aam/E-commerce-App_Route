import 'package:dartz/dartz.dart';
import 'package:ecommerce/domain/entitiy/tabs/favorite_tab_entity/delete_from_favorite.dart';
import 'package:ecommerce/domain/entitiy/tabs/favorite_tab_entity/get_from_favorite.dart';

import '../../entitiy/failuresErrors/failures_errors.dart';
import '../../entitiy/tabs/favorite_tab_entity/add_to_favorite_entity.dart';

abstract class FavoriteTabDataSourceContract {
  Future<Either<FailuresErrors, AddToFavoriteEntity>> addToFavorite(
      {required String id});

  Future<Either<FailuresErrors, GetFromFavoriteEntity>> getFromFavorite();
  Future<Either<FailuresErrors, DeleteFromFavoriteEntity>> deleteFromFavorite({required String id});
}
