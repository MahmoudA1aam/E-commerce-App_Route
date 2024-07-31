import 'UserModelEntitiy.dart';

class RegisterResponseModelEntity {
  RegisterResponseModelEntity({
    this.user,
    this.token,
  });

  UserModelEntity? user;
  String? token;
}
