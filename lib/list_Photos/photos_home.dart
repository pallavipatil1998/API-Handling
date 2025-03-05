import 'dart:convert';

import 'package:api_handling/list_Photos/photos_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;


class PhotosHome extends StatefulWidget {
  const PhotosHome({super.key});

  @override
  State<PhotosHome> createState() => _PhotosHomeState();
}

class _PhotosHomeState extends State<PhotosHome> {
  late Future<List<PhotosModel>> data;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data=getPhoto();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( title: Text("Photos"),),
      body: FutureBuilder(
          future: data,
          builder: (_,snapshot){
           if(snapshot.connectionState==ConnectionState.waiting){
             return Center(child: CircularProgressIndicator());
           }else {
             if(snapshot.hasError){
               return Text("${snapshot.error}");
             }else if(snapshot.hasData){

               return ListView.builder(
                   itemCount: snapshot.data!.hashCode,
                   itemBuilder: (_,index){
                     var eachdata=snapshot.data![index].url!;
                     return ListTile(
                       leading: Text("${snapshot.data![index].id!}"),
                       title:Text("${snapshot.data![index].title!}") ,
                       subtitle: Text("${snapshot.data![index].url!}"),

                     );
                   }
               );
             }
           }
           return Container();
          }
      ),
    );
  }
}


Future<List<PhotosModel>> getPhoto()async{
  List<PhotosModel> photoList=[];
  var res=await http.get(Uri.parse("https://jsonplaceholder.typicode.com/photos"));
  if(res.statusCode==200){
    var json=jsonDecode(res.body);
    for(Map<String,dynamic> eachPhoto in json){
      photoList.add(PhotosModel.fromJson(eachPhoto));
    }
  }
  return photoList;
}
