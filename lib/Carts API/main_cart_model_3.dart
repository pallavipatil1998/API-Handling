import 'package:api_handling/Carts%20API/carts_model_2.dart';

class MainCartModel{
  int limit;
  int skip;
  int total;
  List<CartsModel> carts;


  MainCartModel({
    required this.limit,
    required this.skip,
    required this.total,
    required this.carts

});


  factory MainCartModel.fromJson(Map<String,dynamic> json){
    List<CartsModel> mCarts=[];
    for(Map<String,dynamic> eachCart in json["carts"]){
      mCarts.add(CartsModel.fromJson(eachCart));
    }

    return MainCartModel(
        limit: json["limit"],
        skip: json["skip"],
        total: json["total"],
        carts: mCarts
    );
  }


}