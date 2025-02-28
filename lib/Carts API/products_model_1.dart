class ProductsModel{
  int id;
  double price;
  int quantity;
  double total;
  double discountPercentage;
  double discountedTotal;
  String title;
  String thumbnail;

ProductsModel({
    required this.id,
  required this.price,
  required this.quantity,
  required this.total,
  required this.discountPercentage,
  required this.discountedTotal,
  required this.title,
  required this.thumbnail,

});

factory ProductsModel.fromJson(Map<String,dynamic> json){
  
  return ProductsModel(
      id: json["id"],
      price: json["price"],
      quantity: json["quantity"],
      total: json["total"],
      discountPercentage: json["discountPercentage"],
      discountedTotal: json["discountedTotal"],
      title: json["title"],
      thumbnail: json["thumbnail"]
  );

}




}