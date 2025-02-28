class DimensionsModel {
  double depth;
  double height;
  double width;


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