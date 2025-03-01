class DimensionsModel {
  num? depth;
  num? height;
  num? width;


  DimensionsModel({
     this.height,
     this.width,
     this.depth
  });

  factory DimensionsModel.fromJson(Map<String,dynamic>json){
    return DimensionsModel(
        height: json["height"],
        width: json["width"],
        depth: json["depth"],
    );
  }
}