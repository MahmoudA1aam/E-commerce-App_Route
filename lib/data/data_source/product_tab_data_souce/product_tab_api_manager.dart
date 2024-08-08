import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/constants/constants.dart';
import 'package:ecommerce/data/model_dto/tabs_model_dto/product_tab_model_dto/ProductModelDto.dart';
import 'package:ecommerce/domain/entitiy/failuresErrors/failures_errors.dart';
import 'package:http/http.dart' as http;

class ProductTabApiManager {
  static ProductTabApiManager? _instance;

  ProductTabApiManager._();

  static ProductTabApiManager getInstance() {
    if (_instance == null) {
      _instance = ProductTabApiManager._();
    }
    return _instance!;
  }



Future<Either<FailuresErrors, ProductModelDto>>
getAllProducts() async {
  final List<ConnectivityResult> connectivityResult =
  await (Connectivity().checkConnectivity());
  if (connectivityResult.contains(ConnectivityResult.mobile) ||
      connectivityResult.contains(ConnectivityResult.wifi)) {
    Uri uri = Uri.https(Constants.baseUrl, Constants.allProductApi);
    var response = await http.get(uri);
    print("success");
    ProductModelDto productResponse =
    ProductModelDto.fromJson(jsonDecode(response.body));
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return Right(productResponse);
    } else {
      return Left(FailuresErrors(errorMessage: productResponse.message));
    }
  } else {
    return left(FailuresErrors(errorMessage: "Check internet connection"));
  }
}}

