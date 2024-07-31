import 'package:ecommerce/domain/entitiy/auth_entitiy/login_entitiy/login_Response_Entitiy.dart';

/// message : "success"
/// user : {"name":"mahmoud","email":"mahmoudalaam@gmail.com","role":"user"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY2YTk1ZGYyZWQwZGMwMDE2Y2UyMzg1NiIsIm5hbWUiOiJtYWhtb3VkIiwicm9sZSI6InVzZXIiLCJpYXQiOjE3MjI0MjIyMzEsImV4cCI6MTczMDE5ODIzMX0.yxLLFCzLP7GK6bNwCDpiCyhI0sCSPXtt23-bNycq1IQ"

class LoginResponseModelDto {
  LoginResponseModelDto({this.message, this.user, this.token, this.statusMsg});

  LoginResponseModelDto.fromJson(dynamic json) {
    message = json['message'];
    statusMsg = json['statusMsg'];

    user = json['user'] != null ? UserDto.fromJson(json['user']) : null;
    token = json['token'];
  }

  String? message;
  UserDto? user;
  String? token;
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

  LoginResponseEntityModel toLoginResponseEntityModel() {
    return LoginResponseEntityModel(user: user!.toUserEntity(), token: token);
  }
}

/// name : "mahmoud"
/// email : "mahmoudalaam@gmail.com"
/// role : "user"

class UserDto {
  UserDto({
    this.name,
    this.email,
    this.role,
  });

  UserDto.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
    role = json['role'];
  }

  String? name;
  String? email;
  String? role;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['email'] = email;
    map['role'] = role;
    return map;
  }

  UserEntity toUserEntity() {
    return UserEntity(email: email, name: name, role: role);
  }
}
