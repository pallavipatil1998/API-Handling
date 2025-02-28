import 'package:api_handling/Carts%20API/category_model_1.dart';

class CartsModel{
  int  id;
  int userId ;
  int discountedTotal ;
  int total;
  int  totalProducts;
  int totalQuantity;
  List<ProductsModel> products;


  CartsModel({
    required this.id,
    required this.userId,
    required this.discountedTotal,
    required this.total,
    required this.totalProducts,
    required this.totalQuantity,
    required this.products,


});


  factory CartsModel.fromJson(Map<String,dynamic> json){
    List<ProductsModel> mProducts=[];
    for(Map<String,dynamic> eachProduct in json["products"]){
      mProducts.add(ProductsModel.fromJson(eachProduct));
    }


    return CartsModel(
        id: json["id"],
        userId: json["userId"],
        discountedTotal: json["discountedTotal"],
        total: json["total"],
        totalProducts: json["totalProducts"],
        totalQuantity: json["totalQuantity"],
        products: mProducts
    );

  }


}