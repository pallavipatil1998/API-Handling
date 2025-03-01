class ProductsModel {
  int? id;
  num? price;
  int? quantity;
  num? total;
  num? discountPercentage;
  num? discountedTotal;
  String? title;
  String? thumbnail;

  ProductsModel({
    this.id,
    this.price,
    this.quantity,
    this.total,
    this.discountPercentage,
    this.discountedTotal,
    this.title,
    this.thumbnail,
  });

  factory ProductsModel.fromJson(Map<String, dynamic> json) {
    return ProductsModel(
        id: json["id"],
        price: json["price"],
        quantity: json["quantity"],
        total: json["total"],
        discountPercentage: json["discountPercentage"],
        discountedTotal: json["discountedTotal"],
        title: json["title"],
        thumbnail: json["thumbnail"]);
  }
}
