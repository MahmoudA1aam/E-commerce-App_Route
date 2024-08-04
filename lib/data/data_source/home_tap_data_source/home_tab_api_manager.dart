import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/constants/constants.dart';
import 'package:ecommerce/data/model_dto/tabs_model_dto/home_tab_model_dto/CategoryOrBrandModelDto.dart';
import 'package:ecommerce/domain/entitiy/failuresErrors/failures_errors.dart';
import 'package:http/http.dart' as http;

class HomeTabApiManager {
  static HomeTabApiManager? _instance;

  HomeTabApiManager._();

  static HomeTabApiManager getInstance() {
    if (_instance == null) {
      _instance = HomeTabApiManager._();
    }
    return _instance!;
  }

  Future<Either<FailuresErrors, CategoryOrBrandModelDto>>
      getAllCategory() async {
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      Uri uri = Uri.https(Constants.baseUrl, Constants.allCategoryApi);
      var response = await http.get(uri);
      CategoryOrBrandModelDto categoryModelDto =
          CategoryOrBrandModelDto.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(categoryModelDto);
      } else {
        return Left(FailuresErrors(errorMessage: categoryModelDto.message));
      }
    } else {
      return left(FailuresErrors(errorMessage: "Check internet connection"));
    }
  }

  Future<Either<FailuresErrors, CategoryOrBrandModelDto>> getAllBrands() async {
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      Uri uri = Uri.https(Constants.baseUrl, Constants.allBrandsApi);
      var response = await http.get(uri);
      CategoryOrBrandModelDto brandResponse =
          CategoryOrBrandModelDto.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        print("succes");
        return Right(brandResponse);
      } else {
        print("errrorr");
        return Left(FailuresErrors(errorMessage: brandResponse.message));
      }
    } else {
      return left(FailuresErrors(errorMessage: "Check internet connection"));
    }
  }
}
