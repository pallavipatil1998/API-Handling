import 'package:api_handling/Product%20API/product_model_4.dart';

class MainProductModel {
  int? limit;
  int? skip;

  int? total;
  List<ProductModel>? products;


  MainProductModel({
     this.total,
     this.skip,
     this.limit,
     this.products
  });

  factory MainProductModel.fromJson(Map<String, dynamic>json){
    List<ProductModel> mProduct=[];
    for(Map<String,dynamic> eacgProduct in json["products"]){
      mProduct.add(ProductModel.fromJson(eacgProduct));
    }
    return MainProductModel(
        total: json["total"],
        skip: json["skip"],
        limit: json["limit"],
        products: mProduct
    );
  }


}