import 'coments_model.dart';

class MainCommentsApiModel {
  int limit;
  int skip;
  int total;
  List<ComentsModel> comments;


  MainCommentsApiModel({
    required this.limit,
    required this.skip,
    required this.total,
    required this.comments

  });

  factory MainCommentsApiModel .fromJson(Map<String, dynamic>json){
    List<ComentsModel> mComments=[];
   ( json["comments"] as List<Map<String,dynamic>>).forEach((element) => mComments.add(ComentsModel.fromJson(element)),);
    return MainCommentsApiModel(
        limit: json["limit"],
        skip: json["skip"],
        total: json["total"],
        comments:mComments
    );
  }


}