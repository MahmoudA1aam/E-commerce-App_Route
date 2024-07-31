

import 'package:dartz/dartz.dart';
import 'package:ecommerce/domain/entitiy/auth_entitiy/register_entitiy/RegisterResponseEntitiy.dart';
import 'package:ecommerce/domain/entitiy/failuresErrors/failures_errors.dart';


abstract class AuthRemoteDataSource {
  Future<Either<FailuresErrors,RegisterResponseModelEntity>> register(String name, String email,
      String password, String rePassword, String phone);
}
