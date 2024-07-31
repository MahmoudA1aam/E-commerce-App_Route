import 'package:dartz/dartz.dart';
import 'package:ecommerce/data/repository_imp/auth_repository_imp/auth_repository_imp/auth_repository_imp.dart';
import 'package:ecommerce/domain/entitiy/auth_entitiy/login_entitiy/login_Response_Entitiy.dart';
import 'package:ecommerce/domain/entitiy/failuresErrors/failures_errors.dart';
import 'package:ecommerce/domain/repository_contract/auth_repository_contract/auth_repository_contract/auth_repository_contract.dart';

class LoginUseCase {
  AuthRepositoryContract authRepositoryContract;

  LoginUseCase({required this.authRepositoryContract});

  Future<Either<FailuresErrors, LoginResponseEntityModel>> login(
      {required String email, required String password}) async {
    return await authRepositoryContract.login(email: email, password: password);
  }
}

LoginUseCase injectLoginUseCase() {
  return LoginUseCase(authRepositoryContract: injectAuthRepositoryContract());
}
