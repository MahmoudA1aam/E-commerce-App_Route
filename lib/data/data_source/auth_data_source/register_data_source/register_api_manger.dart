import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce/domain/entitiy/failuresErrors/failures_errors.dart';
import 'package:http/http.dart' as http;

import '../../../../core/constants/constants.dart';
import '../../../model_dto/auth_model_dto/register_model_dto/RegisterRequestModelDto.dart';
import '../../../model_dto/auth_model_dto/register_model_dto/RegisterResponseModelDto.dart';

class RegisterApiManger {
  RegisterApiManger._();

  static RegisterApiManger? _instance;

  static RegisterApiManger getInstance() {
    if (_instance == null) {
      _instance = RegisterApiManger._();
    }
    return _instance!;
  }

  Future<Either<FailuresErrors, RegisterResponseModelDto>> register(String name,
      String email, String password, String rePassword, String phone) async {
    // https://ecommerce.routemisr.com/api/v1/auth/signup
    final List<ConnectivityResult>connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      Uri uri = Uri.https(Constants.baseUrl, Constants.registerApi);
      RegisterRequestModelDto registerRequestBody = RegisterRequestModelDto(
          name: name,
          email: email,
          phone: phone,
          password: password,
          rePassword: rePassword);

      var response = await http.post(uri, body: registerRequestBody.toJson());
      var registerResponse =
          RegisterResponseModelDto.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(registerResponse);
      } else {
        return Left(FailuresErrors(
            errorMessage: registerResponse.error != null
                ? registerResponse.error!.msg
                : registerResponse.message));
      }
    } else {
      //no internet
      return Left(FailuresErrors(errorMessage: "Check internet connection"));
    }
  }
}