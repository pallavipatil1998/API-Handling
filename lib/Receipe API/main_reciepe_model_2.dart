import 'package:api_handling/Receipe%20API/receipe_model_1.dart';

class MainReciepeModel{
  int limit;
  int skip;
  int total;
  List<ReceipeModel> recipes;



  MainReciepeModel({
    required this.limit,
    required this.total,
    required this.skip,
    required this.recipes,
});



  factory MainReciepeModel.fromJson(Map<String,dynamic>json){
    List<ReceipeModel> mReceipe=[];
    (json["recipes"] as List<Map<String,dynamic>>).forEach((element) => mReceipe.add(ReceipeModel.fromMap(element)),);
    return MainReciepeModel(
      total: json["total"],
      skip:json["skip"],
      limit: json["limit"],
      recipes: mReceipe
    );
  }
}