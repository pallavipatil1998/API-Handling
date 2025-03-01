import 'package:api_handling/Todo%20API/todos_model_1.dart';

class MainTodoModel {
  int? limit;
  int? skip;
  int? total;
  List<TodosModel>? todos;


  MainTodoModel({
     this.limit,
     this.skip,
     this.total,
     this.todos,

  });


  factory MainTodoModel.fromJson(Map<String, dynamic>json){
    List<TodosModel> mTodos=[];
    for(Map<String,dynamic> eachTodo in json["todos"]){
      mTodos.add(TodosModel.fromJson(eachTodo));
    }

    // (json["todos"] as List<Map<String,dynamic>>).forEach((element) => mTodos.add(TodosModel.fromJson(element)));

    return MainTodoModel(
        limit: json["limit"],
        skip: json["skip"],
        total: json["total"],
        todos: mTodos
    );
  }

}