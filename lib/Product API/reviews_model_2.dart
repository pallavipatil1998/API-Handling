class ReviewsModel {
  String? comment;
  String? date;
  int? rating;
  String? reviewerEmail;
  String? reviewerName;


  ReviewsModel({
     this.comment,
     this.date,
     this.rating,
     this.reviewerEmail,
     this.reviewerName,
  });


  factory ReviewsModel.fromJson(Map<String,dynamic> json){
    return ReviewsModel(
        comment: json["comment"],
        date: json["date"],
        rating: json["rating"],
        reviewerEmail: json["reviewerEmail"],
        reviewerName: json["reviewerName"]);
  }

}