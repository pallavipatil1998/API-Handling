import 'dart:convert';

import 'package:api_handling/Comments%20API/main_comments_api_model_3.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

class CommentHome extends StatefulWidget {
  const CommentHome({super.key});

  @override
  State<CommentHome> createState() => _CommentHomeState();
}

class _CommentHomeState extends State<CommentHome> {
  late Future<MainCommentsApiModel> data;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data=getComments();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Comments"),),
      body:FutureBuilder(
          future: data,
          builder: (ctx,snapshot){
            if(snapshot.connectionState==ConnectionState.waiting){
              return Center(child: CircularProgressIndicator());
            }
            else{
              if(snapshot.hasError){
                return Center(child: Text("${snapshot.error}"));
              }else if(snapshot.hasData){
                if(snapshot.data!=null && snapshot.data!.comments!=null && snapshot.data!.comments!.isNotEmpty){
                  return ListView.builder(
                    itemCount: snapshot.data!.comments!.length,
                      itemBuilder: (ctx,index){
                      var mcomment=snapshot.data!.comments![index];
                      return ListTile(
                        leading: Text("${mcomment.id}"),
                        title:Text("Name: ${mcomment.user!.fullName}"),
                        subtitle:Text("Comment: ${mcomment.body}") ,
                        trailing:Text("Likes: ${mcomment.likes}") ,
                      );

                      }
                  );

                }
              }
            }
            return Container();
          }
      )

    );
  }
}

Future<MainCommentsApiModel> getComments()async{
  var res=await http.get(Uri.parse("https://dummyjson.com/comments"));
  if(res.statusCode==200){
    var json=jsonDecode(res.body);
    return MainCommentsApiModel.fromJson(json);
  }
  return MainCommentsApiModel();
}