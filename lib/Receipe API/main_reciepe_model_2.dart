import 'package:api_handling/Posts%20API/reactions_model_1.dart';
import 'package:api_handling/Receipe%20API/receipe_model_1.dart';

class MainReciepeModel{
  int? limit;
  int? skip;
  int? total;
  List<ReceipeModel>? recipes;



  MainReciepeModel({
     this.limit,
     this.total,
     this.skip,
     this.recipes,
});



  factory MainReciepeModel.fromJson(Map<String,dynamic>json){
    List<ReceipeModel> mReceipe=[];
    for(Map<String,dynamic> eachReceipe in json["recipes"]){
      mReceipe.add(ReceipeModel.fromMap(eachReceipe));
    }

    // (json["recipes"] as List<Map<String,dynamic>>).forEach((element) => mReceipe.add(ReceipeModel.fromMap(element)),);
    return MainReciepeModel(
      total: json["total"],
      skip:json["skip"],
      limit: json["limit"],
      recipes: mReceipe
    );
  }
}