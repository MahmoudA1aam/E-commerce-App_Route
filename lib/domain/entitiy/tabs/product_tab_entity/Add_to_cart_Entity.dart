/// status : "success"
/// message : "Product added successfully to your cart"
/// numOfCartItems : 2
/// data : {"_id":"66b4dd6fed0dc0016c183ab3","cartOwner":"64235ed0d9a430c3e059165f","products":[{"count":1,"_id":"66b4dd6fed0dc0016c183ab4","product":"6428e884dc1175abc65ca096","price":349},{"count":1,"_id":"66b53c6aed0dc0016c1a9ce8","product":"6428ebc6dc1175abc65ca0b9","price":170}],"createdAt":"2024-08-08T14:59:59.602Z","updatedAt":"2024-08-08T21:45:14.770Z","__v":1,"totalCartPrice":519}

class AddToCartEntity {
  AddToCartEntity({
    this.status,
    this.message,
    this.numOfCartItems,
    this.data,
  });

  String? status;
  String? message;
  int? numOfCartItems;
  AddDataCartEntity? data;
}

class AddDataCartEntity {
  AddDataCartEntity({
    this.id,
    this.cartOwner,
    this.products,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.totalCartPrice,
  });

  String? id;
  String? cartOwner;
  List<AddProductsCartEntity>? products;
  String? createdAt;
  String? updatedAt;
  int? v;
  int? totalCartPrice;
}

class AddProductsCartEntity {
  AddProductsCartEntity({
    this.count,
    this.id,
    this.product,
    this.price,
  });

  int? count;
  String? id;
  String? product;
  int? price;
}
