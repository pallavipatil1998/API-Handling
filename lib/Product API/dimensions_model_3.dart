class DimensionsModel {
  int depth;
  int height;
  int width;


  DimensionsModel({
    required this.height,
    required this.width,
    required this.depth
  });

  factory DimensionsModel.fromJson(Map<String,dynamic>json){
    return DimensionsModel(
        height: json["height"],
        width: json["width"],
        depth: json["depth"],
    );
  }
}