/// message : "success"
/// user : {"name":"mahmoud","email":"mahmoudalaam@gmail.com","role":"user"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY2YTk1ZGYyZWQwZGMwMDE2Y2UyMzg1NiIsIm5hbWUiOiJtYWhtb3VkIiwicm9sZSI6InVzZXIiLCJpYXQiOjE3MjI0MjIyMzEsImV4cCI6MTczMDE5ODIzMX0.yxLLFCzLP7GK6bNwCDpiCyhI0sCSPXtt23-bNycq1IQ"

class LoginResponseEntityModel {
  LoginResponseEntityModel({
    this.user,
    this.token,
  });

  UserEntity? user;
  String? token;
}

/// name : "mahmoud"
/// email : "mahmoudalaam@gmail.com"
/// role : "user"

class UserEntity {
  UserEntity({
    this.name,
    this.email,
    this.role,
  });

  UserEntity.fromJson(dynamic json) {
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
}
