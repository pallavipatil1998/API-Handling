import 'dart:async';
import 'dart:convert';

import 'package:api_handling/Quotes%20API/quotes_data_model_2.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class QuotesHome extends StatefulWidget {
  const QuotesHome({super.key});

  @override
  State<QuotesHome> createState() => _QuotesHomeState();
}

class _QuotesHomeState extends State<QuotesHome> {
  late Future<QuotesDataModel> data;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data = getQuotes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Quotes"),
        ),
        body: FutureBuilder<QuotesDataModel>(
            future: data,
            builder: (context, snapShot) {
              if (snapShot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                if (snapShot.hasError) {
                  return Center(child: Text("${snapShot.error}"));
                } else if (snapShot.hasData) {
                  return ListView.builder(
                      itemCount: snapShot.data!.quotes!.length,
                      itemBuilder: (ctx, index) {
                        return ListTile(
                          leading:Text("${snapShot.data!.quotes![index].id}"),
                          title: Text(snapShot.data!.quotes![index].author),
                          subtitle: Text(snapShot.data!.quotes![index].quote),
                        );
                      });
                }
              }

              return Container(child: Text("Data is not found"),);
            }));
  }
}

Future<QuotesDataModel> getQuotes() async {
  var res = await http.get(Uri.parse("https://dummyjson.com/quotes"));
  //1 get response
  /*print("Response: $res");
  print("StatusCode:${res.statusCode}  & Body:${res.body}");*/

  if (res.statusCode == 200) {
    //2 jsondecode
    var jsonData = jsonDecode(res.body);

    //"" remove on key in jsonData
    // print("JsonData: $jsonData");

    //3 fromjson to get model
    return QuotesDataModel.fromJson(jsonData);

    /*QuotesDataModel data = QuotesDataModel.fromJson(jsonData);
    print("total:${data.total}\n Skip:${data.skip}\n limit:${data.limit} \nquotes:${data.quotes.length}");*/
  }
  return QuotesDataModel();
}
