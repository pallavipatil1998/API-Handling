import 'package:api_handling/Posts%20API/reactions_model_1.dart';

class PostsModel {
  String body;
  int id;
  String title;
  int userId;
  int views;
  ReactionsModel reactions;
  List<String> tags;


  PostsModel({
    required this.body,
    required this.id,
    required this.title,
    required this.userId,
    required this.views,
    required this.reactions,
    required this.tags,
  });


  factory PostsModel.fromJson(Map<String, dynamic> json){
    return PostsModel(
        body: json["body"],
        id:  json["id"],
        title:  json["title"],
        userId:  json["userId"],
        views:  json["views"],
        reactions: ReactionsModel.fromJason(json["reactions"]),
        tags:  json["tags"]
        // tags:  json["tags"].cast<String>(),
    );
  }


}