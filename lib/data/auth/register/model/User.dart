/// name : "Ahmed alaam omer"
/// email : "ahmedalaam896@gmail.com"
/// role : "user"

class User {
  User({
    this.name,
    this.email,
  });

  User.fromJson(dynamic json) {
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
}
