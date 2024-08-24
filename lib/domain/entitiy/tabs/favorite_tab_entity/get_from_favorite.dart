class GetFromFavoriteEntity {
  GetFromFavoriteEntity({
    this.status,
    this.count,
    this.data,
  });

  String? status;
  int? count;
  List<GetDataFromFavoriteEntity>? data;
}

class GetDataFromFavoriteEntity {
  GetDataFromFavoriteEntity({
    this.sold,
    this.images,
    this.subcategory,
    this.ratingsQuantity,
    this.id,
    this.title,
    this.slug,
    this.description,
    this.quantity,
    this.price,
    this.imageCover,
    this.category,
    this.brand,
    this.ratingsAverage,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  int? sold;
  List<String>? images;
  List<SubcategoryFavoriteEntity>? subcategory;
  num? ratingsQuantity;
  String? id;
  String? title;
  String? slug;
  String? description;
  int? quantity;
  int? price;
  String? imageCover;
  CategoryFavoriteEntity? category;
  BrandFavoriteEntity? brand;
  num? ratingsAverage;
  String? createdAt;
  String? updatedAt;
  int? v;
}

class BrandFavoriteEntity {
  BrandFavoriteEntity({
    this.id,
    this.name,
    this.slug,
    this.image,
  });

  String? id;
  String? name;
  String? slug;
  String? image;
}

/// _id : "6439d58a0049ad0b52b9003f"
/// name : "Women's Fashion"
/// slug : "women's-fashion"
/// image : "https://ecommerce.routemisr.com/Route-Academy-categories/1681511818071.jpeg"

class CategoryFavoriteEntity {
  CategoryFavoriteEntity({
    this.id,
    this.name,
    this.slug,
    this.image,
  });

  String? id;
  String? name;
  String? slug;
  String? image;
}

/// _id : "6407f1bcb575d3b90bf95797"
/// name : "Women's Clothing"
/// slug : "women's-clothing"
/// category : "6439d58a0049ad0b52b9003f"

class SubcategoryFavoriteEntity {
  SubcategoryFavoriteEntity({
    this.id,
    this.name,
    this.slug,
    this.category,
  });

  String? id;
  String? name;
  String? slug;
  String? category;
}
