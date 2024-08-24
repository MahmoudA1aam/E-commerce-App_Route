import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/constants/constants.dart';
import 'package:ecommerce/data/model_dto/tabs_model_dto/favorite_tab_model_dto/Get_From_Favorite_Model_Dto.dart';
import 'package:ecommerce/data/model_dto/tabs_model_dto/favorite_tab_model_dto/add_to_favorite_model_dto.dart';
import 'package:ecommerce/data/model_dto/tabs_model_dto/favorite_tab_model_dto/delete_from_favorite_model_dto.dart';
import 'package:ecommerce/domain/entitiy/failuresErrors/failures_errors.dart';
import 'package:http/http.dart' as http;

import '../../../core/widget_helper/shared_preference.dart';
import '../../../domain/entitiy/tabs/favorite_tab_entity/get_from_favorite.dart';

class FavoriteTabApiManager {
  static FavoriteTabApiManager? _instance;

  FavoriteTabApiManager._();

  static FavoriteTabApiManager getInstance() {
    if (_instance == null) {
      return _instance = FavoriteTabApiManager._();
    } else {
      return _instance!;
    }
  }

  Future<Either<FailuresErrors, AddToFavoriteModelDto>> addToFavorite(
      {required String id}) async {
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      var token = SharedPreferenceUtils.getDate(key: "Token");
      Uri uri = Uri.https(Constants.baseUrl, Constants.addToFavorite);
      Map<String, String> header = {"token": token.toString()};
      var response =
          await http.post(uri, headers: header, body: {"productId": "$id"});
      AddToFavoriteModelDto addToFavoriteResponse =
          AddToFavoriteModelDto.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(addToFavoriteResponse);
      } else if (response.statusCode == 401) {
        return Left(
            FailuresErrors(errorMessage: addToFavoriteResponse.message));
      } else {
        return Left(
            FailuresErrors(errorMessage: addToFavoriteResponse.message));
      }
    } else {
      return left(FailuresErrors(errorMessage: "Check internet connection"));
    }
  }

  Future<Either<FailuresErrors, GetFromFavoriteModelDto>>
      getFromFavorite() async {
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      var token = SharedPreferenceUtils.getDate(key: "Token");
      Uri uri = Uri.https(Constants.baseUrl, Constants.addToFavorite);
      Map<String, String> header = {"token": token.toString()};
      var response = await http.get(
        uri,
        headers: header,
      );
      GetFromFavoriteModelDto getFromFavoriteResponse =
          GetFromFavoriteModelDto.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(getFromFavoriteResponse);
      } else if (response.statusCode == 401) {
        return Left(
            FailuresErrors(errorMessage: getFromFavoriteResponse.status));
      } else {
        return Left(
            FailuresErrors(errorMessage: getFromFavoriteResponse.status));
      }
    } else {
      return left(FailuresErrors(errorMessage: "Check internet connection"));
    }
  }

  Future<Either<FailuresErrors, DeleteFromFavoriteModelDto>> deleteFromFavorite(
      {required String id}) async {
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      var token = SharedPreferenceUtils.getDate(key: "Token");
      Uri uri = Uri.https(Constants.baseUrl, "${Constants.addToFavorite}/$id");
      Map<String, String> header = {"token": token.toString()};
      var response = await http.delete(
        uri,
        headers: header,
      );
      DeleteFromFavoriteModelDto deleteFromFavoriteResponse =
          DeleteFromFavoriteModelDto.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(deleteFromFavoriteResponse);
      } else if (response.statusCode == 401) {
        return Left(
            FailuresErrors(errorMessage: deleteFromFavoriteResponse.status));
      } else {
        return Left(
            FailuresErrors(errorMessage: deleteFromFavoriteResponse.status));
      }
    } else {
      return left(FailuresErrors(errorMessage: "Check internet connection"));
    }
  }
}
