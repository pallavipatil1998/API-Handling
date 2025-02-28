import 'package:api_handling/Quotes%20API/quotes_model_1.dart';

class QuotesDataModel {
  int limit;
  int skip;
  int total;
  List<QuotesModel> quotes;

  QuotesDataModel({
    required this.limit,
    required this.skip,
    required this.total,
    required this.quotes
  });



  factory QuotesDataModel.fromJson(Map<String,dynamic> json){
    List<QuotesModel> mQuotes=[];

    for(Map<String,dynamic> eachQuotes in json["quotes"]){
      mQuotes.add(QuotesModel.fromJson(eachQuotes));
    }


  return QuotesDataModel(
  limit: json["limit"],
  skip: json["skip"],
  total: json["total"],
  quotes: mQuotes,
  );
  }


}