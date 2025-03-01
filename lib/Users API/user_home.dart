import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

import 'main_user_api_model_8.dart';

class UserHome extends StatefulWidget {
  const UserHome({super.key});

  @override
  State<UserHome> createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  late Future<MainUserApiModel> data;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data=getUsers();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Users"),),
      body: FutureBuilder<MainUserApiModel>(
          future: data,
          builder: (_,snapshot){
            if(snapshot.connectionState==ConnectionState.waiting){
              return Center(child: CircularProgressIndicator());
            }else{
              if(snapshot.hasError){
                return Center(child: Text("${snapshot.error}"));
            }else if(snapshot.hasData){
                return ListView.builder(
                  itemCount: snapshot.data!.users!.length,
                    itemBuilder: (_,index){
                    var muser=snapshot.data!.users![index];
                    return ListTile(
                      leading: Text("${muser.id}"),
                      title:Column(
                        children: [
                          Text("${muser.firstName}"),
                          Text("${muser.crypto!.coin}"),
                          Text("${muser.bank!.currency}"),
                          Text("${muser.hair!.color}"),
                        ],
                      ) ,
                      subtitle:Text("${muser.id}") ,
                      trailing:Column(
                        children: [
                          Text("${muser.company!.address!.coordinates!.lng}"),
                          Text("${muser.company!.department}"),
                          Text("${muser.company!.address!.city}"),
                        ],
                      ) ,
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

  Future<MainUserApiModel> getUsers()async{
    var res=await http.get(Uri.parse("https://dummyjson.com/users"));
    if(res.statusCode==200){
      var json=jsonDecode(res.body);
      return MainUserApiModel.fromJson(json);
    }
    return MainUserApiModel();
  }}