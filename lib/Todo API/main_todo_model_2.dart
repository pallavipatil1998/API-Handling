import 'package:api_handling/Todo%20API/todos_model_1.dart';

class MainTodoModel {
  int limit;
  int skip;
  int total;
  List<TodosModel> todos;


  MainTodoModel({
    required this.limit,
    required this.skip,
    required this.total,
    required this.todos,

  });


  factory MainTodoModel.fromJson(Map<String, dynamic>json){
    List<TodosModel> mTodos=[];
   (json["todos"] as List<Map<String,dynamic>>).forEach((element) => mTodos.add(TodosModel.fromJson(element)),);
    return MainTodoModel(
        limit: json["limit"],
        skip: json["skip"],
        total: json["total"],
        todos: mTodos
    );
  }

}