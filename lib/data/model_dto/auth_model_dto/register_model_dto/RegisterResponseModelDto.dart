import 'package:ecommerce/domain/entitiy/auth_entitiy/register_entitiy/RegisterResponseEntitiy.dart';

import 'ErrorModelDto.dart';
import 'UserModelDto.dart';

class RegisterResponseModelDto {
  RegisterResponseModelDto({this.message, this.user, this.token, this.error});

  RegisterResponseModelDto.fromJson(dynamic json) {
    message = json['message'];
    user = json['user'] != null ? UserModelDto.fromJson(json['user']) : null;
    error =
        json['errors'] != null ? ErrorsModelDto.fromJson(json['errors']) : null;
    token = json['token'];
    statusMsg = json['statusMsg'];
  }

  String? message;
  UserModelDto? user;
  String? token;
  ErrorsModelDto? error;
  String? statusMsg;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['statusMsg'] = statusMsg;
    if (user != null) {
      map['user'] = user?.toJson();
    }

    map['token'] = token;
    return map;
  }

  RegisterResponseModelEntity toRegisterResponseModelEntity() {
    return RegisterResponseModelEntity(
        token: token, user: user!.toUserModelEntity());
  }
}
