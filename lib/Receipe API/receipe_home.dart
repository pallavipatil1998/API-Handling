import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'main_reciepe_model_2.dart';

class ReceipeHome extends StatefulWidget {
  const ReceipeHome({super.key});

  @override
  State<ReceipeHome> createState() => _ReceipeHomeState();
}

class _ReceipeHomeState extends State<ReceipeHome> {
  late Future<MainReciepeModel> data;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data=getReceipe();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Recepie"),),
      body: FutureBuilder<MainReciepeModel>(
          future: data,
          builder: (_,snapshot){
            if(snapshot.connectionState==ConnectionState.waiting){
              return Center(child: CircularProgressIndicator());
            }else{
              if(snapshot.hasError){
                return Center(child: Text("${snapshot.error}"));
              }else if(snapshot.hasData){
                return ListView.builder(
                  itemCount: snapshot.data!.recipes!.length,
                    itemBuilder: (_,index){
                    var mreceipe= snapshot.data!.recipes![index];
                    return Column(
                      children: [
                        ListTile(
                          leading:Text("${mreceipe.id}") ,
                          title: Text("${mreceipe.name}"),
                          subtitle:Image.network(mreceipe.image!,) ,
                          trailing: Text("Ratings: ${mreceipe.rating}"),

                        ),

                        ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: mreceipe.tags!.length,
                            itemBuilder: (_,tindex){
                            return Text("Tags: ${mreceipe.tags![tindex]}") ;

                            }
                        ),
                      ],
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

Future<MainReciepeModel> getReceipe()async{
  var res=await  http.get(Uri.parse("https://dummyjson.com/recipes"));
  if(res.statusCode==200){
    var json=jsonDecode(res.body);
    return MainReciepeModel.fromJson(json);
  }
  return MainReciepeModel();
}