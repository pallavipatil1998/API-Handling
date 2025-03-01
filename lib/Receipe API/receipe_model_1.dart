class ReceipeModel {
  int? caloriesPerServing;
  int? cookTimeMinutes;
  String? cuisine;
  String? difficulty;
  int? id;
  String? image;
  String? name;
  int? prepTimeMinutes;
  num? rating;
  int? reviewCount;
  int? servings;
  int? userId;
  List<dynamic>? ingredients;
  List<dynamic>? instructions;
  List<dynamic>? mealType;
  List<dynamic>? tags;


  ReceipeModel({
     this.caloriesPerServing,
     this.userId,
     this.id,
     this.tags,
     this.rating,
     this.image,
     this.name,
     this.cookTimeMinutes,
     this.cuisine,
     this.difficulty,
     this.ingredients,
     this.instructions,
     this.mealType,
     this.prepTimeMinutes,
     this.reviewCount,
     this.servings,


  });


  factory ReceipeModel.fromMap(Map<String, dynamic>json){
    return ReceipeModel(
        caloriesPerServing: json["caloriesPerServing"],
        userId: json["userId"],
        id: json["id"],
        tags: json["tags"],
        rating: json["rating"],
        image: json["image"],
        name: json["name"],
        cookTimeMinutes: json["cookTimeMinutes"],
        cuisine: json["cuisine"],
        difficulty: json["difficulty"],
        ingredients: json["ingredients"],
        instructions: json["instructions"],
        mealType: json["mealType"],
        prepTimeMinutes: json["prepTimeMinutes"],
        reviewCount: json["reviewCount"],
        servings: json["servings"]
    );
  }


}