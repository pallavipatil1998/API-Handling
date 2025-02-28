class QuotesModel {
  int id;
  String quote;
  String author;


  QuotesModel({required this.id,required this.quote,required this.author});


  factory QuotesModel.fromJson(Map<String,dynamic> json){
    return QuotesModel(
    id: json["id"],
    quote: json["quote"],
    author: json["author"]
    );
  }



}