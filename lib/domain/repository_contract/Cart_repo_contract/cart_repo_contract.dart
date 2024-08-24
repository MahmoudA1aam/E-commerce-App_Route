import 'package:dartz/dartz.dart';

import '../../entitiy/failuresErrors/failures_errors.dart';
import '../../entitiy/tabs/product_tab_entity/Get_Response_from_Cart_Entity.dart';

abstract class CartRepoContract {
  Future<Either<FailuresErrors, GetResponseFromCartEntity>> getFromCart();
  Future<Either<FailuresErrors,GetResponseFromCartEntity>>deleteItemOfCart({required String id});
  Future<Either<FailuresErrors,GetResponseFromCartEntity>>updateCountOfCart({required String id,required int count});
}
