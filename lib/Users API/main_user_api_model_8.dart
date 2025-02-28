import 'package:api_handling/Users%20API/user_model_7.dart';

class MainUserApiModel{
  int limit;
  int skip;
  int total;
  List<UserModel> users;


  MainUserApiModel({
    required this.limit,
    required this.skip,
    required this.total,
    required this.users
});


  factory MainUserApiModel.fromJson(Map<String,dynamic> json){
    List<UserModel> mUser=[];
    for(Map<String,dynamic> eachUser in json["users"] ){
      mUser.add(UserModel.fromJson(eachUser));
    }
    return MainUserApiModel(
      limit:json["limit"] ,
      skip: json["skip"],
      total: json["total"],
      users:mUser
    );
  }

}