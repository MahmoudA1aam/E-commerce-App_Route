/// status : "success"
/// message : "Product removed successfully to your wishlist"
/// data : ["6428eb43dc1175abc65ca0b3"]

class DeleteFromFavoriteEntity {
  DeleteFromFavoriteEntity({
    this.status,
    this.message,
    this.data,
  });

  String? status;
  String? message;
  List<String>? data;
}
