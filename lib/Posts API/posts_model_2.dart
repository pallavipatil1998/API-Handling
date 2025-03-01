import 'package:api_handling/Posts%20API/reactions_model_1.dart';

class PostsModel {
  String? body;
  int? id;
  String? title;
  int? userId;
  int? views;
  ReactionsModel? reactions;
  List<dynamic>? tags;


  PostsModel({
     this.body,
     this.id,
     this.title,
     this.userId,
     this.views,
     this.reactions,
     this.tags,
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
    );
  }


}