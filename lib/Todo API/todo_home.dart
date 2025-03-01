import 'dart:async';
import 'dart:convert';

import 'package:api_handling/Todo%20API/main_todo_model_2.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TodoHome extends StatefulWidget {
  const TodoHome({super.key});

  @override
  State<TodoHome> createState() => _TodoHomeState();
}

class _TodoHomeState extends State<TodoHome> {
  late Future<MainTodoModel> data;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data = getTodo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo"),
      ),
      body: FutureBuilder<MainTodoModel>(
          future: data,
          builder: (ctx,snapshot){
            if(snapshot.connectionState==ConnectionState.waiting){
              return Center(child: CircularProgressIndicator());
            }else {
              if (snapshot.hasError) {
                print("${snapshot.error}");
                return Center(child: Text("${snapshot.error}"));

              } else {
                if (snapshot.hasData){
                  return ListView.builder(
                    itemCount:snapshot.data!.todos!.length ,
                      itemBuilder: (ctx,index){
                      return ListTile(
                        leading: Text("${snapshot.data!.todos![index].id}"),
                        title: Text(snapshot.data!.todos![index].todo),
                        subtitle:Text("${snapshot.data!.todos![index].completed}") ,
                        trailing: Text("${snapshot.data!.todos![index].userId}"),
                      );
                      }
                  );
                }
              }
            }
            return Container( child: Text("No data found"),);
          }
      ),
    );
  }
}

Future<MainTodoModel> getTodo() async {
  var res = await http.get(Uri.parse("https://dummyjson.com/todos"));
  print("${res.body}");
  print("${res.statusCode}");
  if (res.statusCode == 200) {
    var json=jsonDecode(res.body);
   return MainTodoModel.fromJson(json);
  }
  return MainTodoModel();
}
