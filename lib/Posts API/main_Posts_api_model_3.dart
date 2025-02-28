import 'package:api_handling/Posts%20API/posts_model_2.dart';

class MainPostsApiModel {
  int limit;
  int skip;
  int total;
  List<PostsModel> posts;

  MainPostsApiModel({
    required this.limit,
    required this.skip,
    required this.total,
    required this.posts,

  });


  factory MainPostsApiModel.fromJson(Map<String, dynamic> json){
    List<PostsModel> mPosts=[];
    for(Map<String,dynamic> eactPosts in json["posts"]){
      mPosts.add(PostsModel.fromJson(eactPosts));

    }
    return MainPostsApiModel(
        limit: json["limit"],
        skip: json["skip"],
        total: json["total"],
        posts: mPosts
    );
  }


}