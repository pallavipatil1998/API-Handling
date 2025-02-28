class ReactionsModel {
  int dislikes;
  int likes;

  ReactionsModel({
    required this.dislikes,
    required this.likes
  });


  factory ReactionsModel.fromJason(Map<String,dynamic> json){
    return ReactionsModel(
        dislikes: json["dislikes"],
        likes: json["likes"]
    );
  }


}