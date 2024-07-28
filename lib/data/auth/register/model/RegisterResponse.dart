 import 'User.dart';

/// message : "success"
/// user : {"name":"Ahmed alaam omer","email":"ahmedalaam896@gmail.com","role":"user"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY2YTY5ODY5ZWQwZGMwMDE2Y2Q4ZTg3OCIsIm5hbWUiOiJBaG1lZCBhbGFhbSBvbWVyIiwicm9sZSI6InVzZXIiLCJpYXQiOjE3MjIxOTQwMjYsImV4cCI6MTcyOTk3MDAyNn0.MOnXXw5h67F1Aas3FA1kbvfZQ73kKVE-uAWd35ZOOok"

class RegisterResponse {
  RegisterResponse({
      this.message, 
      this.user, 
      this.token,});

  RegisterResponse.fromJson(dynamic json) {
    message = json['message'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    token = json['token'];
  }
  String? message;
  User? user;
  String? token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    map['token'] = token;
    return map;
  }

}