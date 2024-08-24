import 'package:ecommerce/domain/entitiy/tabs/product_tab_entity/Add_to_cart_Entity.dart';

/// status : "success"
/// message : "Product added successfully to your cart"
/// numOfCartItems : 2
/// data : {"_id":"66b4dd6fed0dc0016c183ab3","cartOwner":"64235ed0d9a430c3e059165f","products":[{"count":1,"_id":"66b4dd6fed0dc0016c183ab4","product":"6428e884dc1175abc65ca096","price":349},{"count":1,"_id":"66b53c6aed0dc0016c1a9ce8","product":"6428ebc6dc1175abc65ca0b9","price":170}],"createdAt":"2024-08-08T14:59:59.602Z","updatedAt":"2024-08-08T21:45:14.770Z","__v":1,"totalCartPrice":519}

class AddToCartModelDto extends AddToCartEntity {
  AddToCartModelDto({
    super.status,
    super.message,
    super.numOfCartItems,
    super.data,
  });

  AddToCartModelDto.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    numOfCartItems = json['numOfCartItems'];
    data = json['data'] != null
        ? AddDataCartModelDto.fromJson(json['data'])
        : null;
  }
}

/// _id : "66b4dd6fed0dc0016c183ab3"
/// cartOwner : "64235ed0d9a430c3e059165f"
/// products : [{"count":1,"_id":"66b4dd6fed0dc0016c183ab4","product":"6428e884dc1175abc65ca096","price":349},{"count":1,"_id":"66b53c6aed0dc0016c1a9ce8","product":"6428ebc6dc1175abc65ca0b9","price":170}]
/// createdAt : "2024-08-08T14:59:59.602Z"
/// updatedAt : "2024-08-08T21:45:14.770Z"
/// __v : 1
/// totalCartPrice : 519

class AddDataCartModelDto extends AddDataCartEntity {
  AddDataCartModelDto({
    super.id,
    super.cartOwner,
    super.products,
    super.createdAt,
    super.updatedAt,
    super.v,
    super.totalCartPrice,
  });

  AddDataCartModelDto.fromJson(dynamic json) {
    id = json['_id'];
    cartOwner = json['cartOwner'];
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products?.add(AddProductsCartModelDto.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
    totalCartPrice = json['totalCartPrice'];
  }
}

/// count : 1
/// _id : "66b4dd6fed0dc0016c183ab4"
/// product : "6428e884dc1175abc65ca096"
/// price : 349

class AddProductsCartModelDto extends AddProductsCartEntity {
  AddProductsCartModelDto({
    super.count,
    super.id,
    super.product,
    super.price,
  });

  AddProductsCartModelDto.fromJson(dynamic json) {
    count = json['count'];
    id = json['_id'];
    product = json['product'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['count'] = count;
    map['_id'] = id;
    map['product'] = product;
    map['price'] = price;
    return map;
  }
}
