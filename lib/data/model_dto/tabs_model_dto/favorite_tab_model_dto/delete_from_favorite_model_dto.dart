import 'package:ecommerce/domain/entitiy/tabs/favorite_tab_entity/delete_from_favorite.dart';

/// status : "success"
/// message : "Product removed successfully to your wishlist"
/// data : ["6428eb43dc1175abc65ca0b3"]

class DeleteFromFavoriteModelDto  extends DeleteFromFavoriteEntity{
  DeleteFromFavoriteModelDto({
      super.status,
      super.message,
      super.data,});

  DeleteFromFavoriteModelDto.fromJson(dynamic json) {
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