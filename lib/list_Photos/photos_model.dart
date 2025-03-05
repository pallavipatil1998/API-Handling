class PhotosModel{
  int? id;
  int? albumId;
  String? thumbnailUrl;
  String?title ;
  String? url;

  PhotosModel({
    this.title,
    this.url,
    this.id,
    this.albumId,
    this.thumbnailUrl
});


  factory PhotosModel.fromJson(Map<String,dynamic> json){
    return PhotosModel(
      title: json["title"],
      url: json["url"] ,
      id:  json["id"],
      albumId: json["albumId"] ,
      thumbnailUrl:  json["thumbnailUrl"]
    );
  }




}