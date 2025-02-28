class UserModel{
  String fullName;
  String username;
  int id;

  UserModel({
    required this.fullName,
    required this.username,
    required this.id
});


  factory UserModel.fromJson(Map<String,dynamic>json){
    return UserModel(
        fullName: json["fullName"],
        username: json["username"],
        id: json["id"]
    );
  }

}