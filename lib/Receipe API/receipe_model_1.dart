class ReceipeModel {
  int caloriesPerServing;
  int cookTimeMinutes;
  String cuisine;
  String difficulty;
  int id;
  String image;
  String name;
  int prepTimeMinutes;
  double rating;
  int reviewCount;
  int servings;
  int userId;
  List<String> ingredients;
  List<String> instructions;
  List<String> mealType;
  List<String> tags;


  ReceipeModel({
    required this.caloriesPerServing,
    required this.userId,
    required this.id,
    required this.tags,
    required this.rating,
    required this.image,
    required this.name,
    required this.cookTimeMinutes,
    required this.cuisine,
    required this.difficulty,
    required this.ingredients,
    required this.instructions,
    required this.mealType,
    required this.prepTimeMinutes,
    required this.reviewCount,
    required this.servings,


  });


  factory ReceipeModel.fromMap(Map<String, dynamic>json){
    return ReceipeModel(
        caloriesPerServing: json["caloriesPerServing"],
        userId: json["userId"],
        id: json["id"],
        tags: json["tags"].cast<String>(),
        rating: json["rating"],
        image: json["image"],
        name: json["name"],
        cookTimeMinutes: json["cookTimeMinutes"],
        cuisine: json["cuisine"],
        difficulty: json["difficulty"],
        ingredients: json["ingredients"].cast<String>(),
        instructions: json["instructions"].cast<String>(),
        mealType: json["mealType"].cast<String>(),
        prepTimeMinutes: json["prepTimeMinutes"],
        reviewCount: json["reviewCount"],
        servings: json["servings"]
    );
  }


}