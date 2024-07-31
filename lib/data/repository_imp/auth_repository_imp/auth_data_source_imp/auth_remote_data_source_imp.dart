import 'package:dartz/dartz.dart';
import 'package:ecommerce/domain/entitiy/auth_entitiy/register_entitiy/RegisterResponseEntitiy.dart';
import 'package:ecommerce/domain/entitiy/failuresErrors/failures_errors.dart';

import '../../../../domain/repository_contract/auth_repository_contract/auth_data_source_contract/auth_remote_data_source.dart';
import '../../../data_source/auth_data_source/register_data_source/register_api_manger.dart';
import '../../../model_dto/auth_model_dto/register_model_dto/RegisterResponseModelDto.dart';

class AuthRemoteDataSourceImp implements AuthRemoteDataSource {
  AuthRemoteDataSourceImp({required this.registerApiManger});

  RegisterApiManger registerApiManger;

  @override
  Future<Either<FailuresErrors, RegisterResponseModelEntity>> register(
      String name,
      String email,
      String password,
      String rePassword,
      String phone) async {
    var eitherResponse = await registerApiManger.register(
        name, email, password, rePassword, phone);
    return eitherResponse.fold(
      (l) {
        return left(FailuresErrors(errorMessage: l.errorMessage));
      },
      (response) {
        return Right(response.toRegisterResponseModelEntity());
      },
    );
  }
}

AuthRemoteDataSource injectAuthRemoteDataSource() {
  return AuthRemoteDataSourceImp(
      registerApiManger: RegisterApiManger.getInstance());
}
