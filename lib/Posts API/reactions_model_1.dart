class ReactionsModel {
  int? dislikes;
  int? likes;

  ReactionsModel({
     this.dislikes,
     this.likes
  });


  factory ReactionsModel.fromJason(Map<String,dynamic> json){
    return ReactionsModel(
        dislikes: json["dislikes"],
        likes: json["likes"]
    );
  }


}