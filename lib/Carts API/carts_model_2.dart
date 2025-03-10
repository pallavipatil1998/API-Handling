import 'package:api_handling/Carts%20API/products_model_1.dart';

class CartsModel{
  int?  id;
  int? userId ;
  num? discountedTotal ;
  num? total;
  int?  totalProducts;
  int? totalQuantity;
  List<ProductsModel>? products;


  CartsModel({
     this.id,
     this.userId,
     this.discountedTotal,
     this.total,
     this.totalProducts,
     this.totalQuantity,
     this.products,


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