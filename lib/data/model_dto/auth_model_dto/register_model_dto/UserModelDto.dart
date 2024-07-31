import 'package:ecommerce/domain/entitiy/auth_entitiy/register_entitiy/UserModelEntitiy.dart';

/// name : "Ahmed alaam omer"
/// email : "ahmedalaam896@gmail.com"
/// role : "user"

class UserModelDto {
  UserModelDto({
    this.name,
    this.email,
  });

  UserModelDto.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
  }

  String? name;
  String? email;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['email'] = email;

    return map;
  }
  UserModelEntity toUserModelEntity(){
   return UserModelEntity(email: email,name: name);
  }
}
