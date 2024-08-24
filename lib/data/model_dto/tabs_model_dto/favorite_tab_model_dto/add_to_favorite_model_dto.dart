import 'package:ecommerce/domain/entitiy/tabs/favorite_tab_entity/add_to_favorite_entity.dart';

class AddToFavoriteModelDto extends AddToFavoriteEntity {
  AddToFavoriteModelDto({
    super.status,
    super.message,
    super.data,
  });

  AddToFavoriteModelDto.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? json['data'].cast<String>() : [];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    map['data'] = data;
    return map;
  }
}
