import 'coments_model.dart';

class MainCommentsApiModel {
  int? limit;
  int? skip;
  int? total;
  List<ComentsModel>? comments;


  MainCommentsApiModel({
     this.limit,
     this.skip,
     this.total,
     this.comments

  });

  factory MainCommentsApiModel .fromJson(Map<String, dynamic>json){
    List<ComentsModel> mComments=[];
    for(Map<String,dynamic> eachComment in json["comments"]){
      mComments.add(ComentsModel.fromJson(eachComment)) ;
    }
   // ( json["comments"] as List<Map<String,dynamic>>).forEach((element) => mComments.add(ComentsModel.fromJson(element)),);
    return MainCommentsApiModel(
        limit: json["limit"],
        skip: json["skip"],
        total: json["total"],
        comments:mComments
    );
  }


}