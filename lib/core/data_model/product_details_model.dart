class ProductDetailsModel {
  List<String>? urlImage;
  String? title, description, id;
  int? price, sold, quantity,count;
  num? ratingsAverage, ratingsQuantity;
  bool inCart;

  ProductDetailsModel(
      {required this.urlImage,
        this.count,
      required this.id,
      required this.title,
      required this.description,
      required this.price,
      required this.sold,
      required this.quantity,
      required this.ratingsAverage,
      required this.ratingsQuantity,
      required this.inCart});
}
