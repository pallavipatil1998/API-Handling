import 'dart:convert';

import 'package:flutter/material.dart';

import 'main_Posts_api_model_3.dart';
import 'package:http/http.dart'as http;

class PostHome extends StatefulWidget {
  const PostHome({super.key});

  @override
  State<PostHome> createState() => _PostHomeState();
}

class _PostHomeState extends State<PostHome> {
  late Future<MainPostsApiModel> data;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data=getPosts();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Posts"),),
      body: FutureBuilder<MainPostsApiModel>(
          future: data, 
          builder: (ctx,snapshot){
            if(snapshot.connectionState==ConnectionState.waiting){
              return Center(child: CircularProgressIndicator());
            }else{
              if(snapshot.hasError){
                return Text("${snapshot.error}");
              }else if(snapshot.hasData){
                return ListView.builder(
                   itemCount: snapshot.data!.posts!.length,
                    itemBuilder: (ctx,index){
                      var mpost=snapshot.data!.posts![index];
                      return Column(
                        children: [
                          ListTile(
                            leading: Text("${mpost.id}"),
                            title: Text("${mpost!.title}"),
                            subtitle:Text("${mpost!.body}") ,
                            trailing: Text("${mpost!.reactions!.likes}"),
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: mpost.tags!.length,
                              itemBuilder: (_,tindex){
                            return Text(mpost.tags![tindex]);
                          })
                        ],
                      );
                      
                    });
              }
            }
            return Container();
          }
      )
    );
  }
}

Future<MainPostsApiModel> getPosts()async{
  var res=await http.get(Uri.parse("https://dummyjson.com/posts"));
  if(res.statusCode==200){
    var json=jsonDecode(res.body);
    return MainPostsApiModel.fromJson(json);
  }
  return MainPostsApiModel();
}