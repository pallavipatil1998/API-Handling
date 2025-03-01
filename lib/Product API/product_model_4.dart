import 'package:api_handling/Product%20API/reviews_model_2.dart';

import 'dimensions_model_3.dart';
import 'meta_model_1.dart';

class ProductModel {
  String availabilityStatus;
  String brand;
  String category;
  String description;
  DimensionsModel dimensions;
  double discountPercentage;
  int id;
  List<String> images;
  MetaModel meta;
  int minimumOrderQuantity;
  double price;
  double rating;
  String returnPolicy;
  List<ReviewsModel> reviews;
  String shippingInformation;
  String sku;
  int stock;
  List<String> tags;
  String thumbnail;
  String title;
  String warrantyInformation;
  int weight;


  ProductModel({
    required this.rating,
    required this.weight,
    required this.id,
    required this.title,
    required this.thumbnail,
    required this.discountPercentage,
    required this.price,
    required this.description,
    required this.availabilityStatus,
    required this.brand,
    required this.category,
    required this.dimensions,
    required this.images,
    required this.meta,
    required this.minimumOrderQuantity,
    required this.returnPolicy,
    required this.reviews,
    required this.shippingInformation,
    required this.sku,
    required this.stock,
    required this.tags,
    required this.warrantyInformation,
  });


  factory ProductModel.fromJson(Map<String, dynamic> json){
    List<ReviewsModel> mReview=[];
    
    for(Map<String,dynamic> eachReviews in json["reviews"]){
      mReview.add(ReviewsModel.fromJson(eachReviews));
    }
   


    return ProductModel(
        rating: json["rating"],
        weight: json["weight"],
        id: json["id"],
        title: json["title"],
        thumbnail: json["thumbnail"],
        discountPercentage: json["discountPercentage"],
        price: json["price"],
        description: json["description"],
        availabilityStatus: json["availabilityStatus"],
        brand: json["brand"],
        category: json["category"],
        dimensions: DimensionsModel.fromJson(json["dimensions"]),
        images: json["images"],
        meta: MetaModel.fromJson(json["meta"]),
        minimumOrderQuantity: json["minimumOrderQuantity"],
        returnPolicy: json["returnPolicy"],
        reviews: mReview,
        shippingInformation: json["shippingInformation"],
        sku: json["sku"],
        stock: json["stock"],
        tags: json["tags"],
        warrantyInformation: json["warrantyInformation"]
    );
  }


}