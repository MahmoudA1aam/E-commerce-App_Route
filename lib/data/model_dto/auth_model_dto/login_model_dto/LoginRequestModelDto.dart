/// email : "mahmoudalaam@gmail.com"
/// password : "Mah13579@"

class LoginRequestModelDto {
  LoginRequestModelDto({
      this.email, 
      this.password,});

  LoginRequestModelDto.fromJson(dynamic json) {
    email = json['email'];
    password = json['password'];
  }
  String? email;
  String? password;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = email;
    map['password'] = password;
    return map;
  }

}