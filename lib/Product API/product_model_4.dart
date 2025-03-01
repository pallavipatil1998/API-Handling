import 'package:api_handling/Product%20API/reviews_model_2.dart';

import 'dimensions_model_3.dart';
import 'meta_model_1.dart';

class ProductModel {
  String? availabilityStatus;
  String? brand;
  String? category;
  String? description;
  DimensionsModel? dimensions;
  num? discountPercentage;
  int? id;
  List<dynamic>? images;
  MetaModel? meta;
  int? minimumOrderQuantity;
  num? price;
  num? rating;
  String? returnPolicy;
  List<ReviewsModel>? reviews;
  String? shippingInformation;
  String? sku;
  int? stock;
  List<dynamic>? tags;
  String? thumbnail;
  String? title;
  String? warrantyInformation;
  int? weight;


  ProductModel({
     this.rating,
     this.weight,
     this.id,
     this.title,
     this.thumbnail,
     this.discountPercentage,
     this.price,
     this.description,
     this.availabilityStatus,
     this.brand,
     this.category,
     this.dimensions,
     this.images,
     this.meta,
     this.minimumOrderQuantity,
     this.returnPolicy,
     this.reviews,
     this.shippingInformation,
     this.sku,
     this.stock,
     this.tags,
     this.warrantyInformation,
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
        images:  json["images"],
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