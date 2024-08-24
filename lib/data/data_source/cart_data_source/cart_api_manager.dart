import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import '../../../core/constants/constants.dart';
import '../../../core/widget_helper/shared_preference.dart';
import '../../../domain/entitiy/failuresErrors/failures_errors.dart';

import '../../model_dto/tabs_model_dto/product_tab_model_dto/Get_from_Cart_Model_Dto.dart';

class CartApiManager {
  static CartApiManager? _instance;

  CartApiManager._();

  static CartApiManager getInstance() {
    if (_instance == null) {
      _instance = CartApiManager._();
    }
    return _instance!;
  }

  Future<Either<FailuresErrors, GetFromCartModelDto>> getFromCart() async {
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      var token = SharedPreferenceUtils.getDate(key: "Token");
      Uri uri = Uri.https(Constants.baseUrl, Constants.addToCartApi);
      Map<String, String> header = {"token": token.toString()};
      var response = await http.get(
        uri,
        headers: header,
      );

      GetFromCartModelDto getFromCartResponse =
          GetFromCartModelDto.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(getFromCartResponse);
      } else if (response.statusCode == 401) {
        return Left(FailuresErrors(errorMessage: getFromCartResponse.message));
      } else {
        return Left(FailuresErrors(errorMessage: getFromCartResponse.message));
      }
    } else {
      return left(FailuresErrors(errorMessage: "Check internet connection"));
    }
  }

  Future<Either<FailuresErrors, GetFromCartModelDto>> deleteItemOfCart(
      {required String id}) async {
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      var token = SharedPreferenceUtils.getDate(key: "Token");
      Uri uri = Uri.https(
        Constants.baseUrl,
        "${Constants.addToCartApi}/$id",
      );
      Map<String, String> header = {"token": token.toString()};

      var response = await http.delete(
        uri,
        headers: header,
      );

      GetFromCartModelDto deleteItemFromCartResponse =
          GetFromCartModelDto.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(deleteItemFromCartResponse);
      } else if (response.statusCode == 401) {
        return Left(
            FailuresErrors(errorMessage: deleteItemFromCartResponse.message));
      } else {
        return Left(
            FailuresErrors(errorMessage: deleteItemFromCartResponse.message));
      }
    } else {
      return left(FailuresErrors(errorMessage: "Check internet connection"));
    }
  }

  Future<Either<FailuresErrors, GetFromCartModelDto>> updateCountOfCart(
      {required String id, required int count}) async {
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      var token = SharedPreferenceUtils.getDate(key: "Token");
      Uri uri = Uri.https(
        Constants.baseUrl,
        "${Constants.addToCartApi}/$id",
      );
      Map<String, String> header = {"token": token.toString()};

      var response =
          await http.put(uri, headers: header, body: {"count": "$count"});

      GetFromCartModelDto updateCountItemCartResponse =
          GetFromCartModelDto.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        print("api success");
        return Right(updateCountItemCartResponse);
      } else if (response.statusCode == 401) {
        print("api error");
        return Left(

            FailuresErrors(errorMessage: updateCountItemCartResponse.message));
      } else {
        return Left(
            FailuresErrors(errorMessage: updateCountItemCartResponse.message));
      }
    } else {
      return left(FailuresErrors(errorMessage: "Check internet connection"));
    }
  }
}
