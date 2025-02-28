import 'package:api_handling/Carts%20API/carts_model_2.dart';
import 'package:api_handling/Comments%20API/use_model_1.dart';

class ComentsModel {
  String body;
  int id;
  int likes;
  int postId;
  UserModel user;


  ComentsModel({
    required this.body,
    required this.id,
    required this.likes,
    required this.postId,
    required this.user,
  });


  factory ComentsModel.fromJson(Map<String, dynamic>json){
    return ComentsModel(
        body: json["body"],
        id: json["id"],
        likes: json["likes"],
        postId: json["postId"],
        user: UserModel.fromJson(json["user"])
    );
  }


}