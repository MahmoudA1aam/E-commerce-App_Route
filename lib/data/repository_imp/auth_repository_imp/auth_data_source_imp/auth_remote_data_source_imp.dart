import 'package:dartz/dartz.dart';

import '../../../../domain/entitiy/auth_entitiy/login_entitiy/login_Response_Entitiy.dart';
import '../../../../domain/entitiy/auth_entitiy/register_entitiy/RegisterResponseEntitiy.dart';
import '../../../../domain/entitiy/failuresErrors/failures_errors.dart';
import '../../../../domain/repository_contract/auth_repository_contract/auth_data_source_contract/auth_remote_data_source.dart';
import '../../../data_source/auth_data_source/auth_api_manager.dart';

class AuthRemoteDataSourceImp implements AuthRemoteDataSource {
  AuthRemoteDataSourceImp({required this.authApiManager});

  AuthApiManager authApiManager;

  @override
  Future<Either<FailuresErrors, RegisterResponseModelEntity>> register(
      String name,
      String email,
      String password,
      String rePassword,
      String phone) async {
    var eitherResponse =
        await authApiManager.register(name, email, password, rePassword, phone);
    return eitherResponse.fold(
      (l) {
        return left(FailuresErrors(errorMessage: l.errorMessage));
      },
      (response) {
        return Right(response.toRegisterResponseModelEntity());
      },
    );
  }

  @override
  Future<Either<FailuresErrors, LoginResponseEntityModel>> login(
      {required String email,required String password}) async {
    var eitherResponse =
        await authApiManager.login(email: email, password: password);
    return eitherResponse.fold(
      (l) {
        return Left(FailuresErrors(errorMessage: l.errorMessage));
      },
      (response) {
        return Right(response.toLoginResponseEntityModel());
      },
    );
  }
}

AuthRemoteDataSource injectAuthRemoteDataSource() {
  return AuthRemoteDataSourceImp(authApiManager: AuthApiManager.getInstance());
}
