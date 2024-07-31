import 'package:dartz/dartz.dart';
import 'package:ecommerce/domain/entitiy/auth_entitiy/login_entitiy/login_Response_Entitiy.dart';
import 'package:ecommerce/domain/entitiy/auth_entitiy/register_entitiy/RegisterResponseEntitiy.dart';
import 'package:ecommerce/domain/entitiy/failuresErrors/failures_errors.dart';

import '../../../../domain/repository_contract/auth_repository_contract/auth_data_source_contract/auth_remote_data_source.dart';
import '../../../../domain/repository_contract/auth_repository_contract/auth_repository_contract/auth_repository_contract.dart';

import '../auth_data_source_imp/auth_remote_data_source_imp.dart';

class AuthRepositoryImp implements AuthRepositoryContract {
  AuthRemoteDataSource authRemoteDataSource;

  AuthRepositoryImp({required this.authRemoteDataSource});

  @override
  Future<Either<FailuresErrors, RegisterResponseModelEntity>> register(
      String name,
      String email,
      String password,
      String rePassword,
      String phone) async {
    var response = await authRemoteDataSource.register(
        name, email, password, rePassword, phone);
    return response;
  }

  @override
  Future<Either<FailuresErrors, LoginResponseEntityModel>> login(
      {required String email,required String password}) async {
    var response =
        await authRemoteDataSource.login(email: email, password: password);
    return response;
  }
}

AuthRepositoryContract injectAuthRepositoryContract() {
  return AuthRepositoryImp(authRemoteDataSource: injectAuthRemoteDataSource());
}
