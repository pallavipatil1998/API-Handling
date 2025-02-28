class TodosModel {
  bool completed;
  int id;
  String todo;
  int userId;


  TodosModel({
    required this.completed,
    required this.id,
    required this.todo,
    required this.userId,
  });


  factory TodosModel.fromJson(Map<String, dynamic>json){
    return TodosModel(
        completed: json["completed"],
        id: json["id"],
        todo: json["todo"],
        userId: json["userId"]
    );
  }


}