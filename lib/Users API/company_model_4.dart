import 'package:api_handling/Users%20API/address_model_3.dart';

class CompanyModel{
  String department;
  String name;
  String title;
  AddressModel address;

  CompanyModel({
    required this.department,
    required this.name,
    required this.title,
    required this.address,

});

  factory CompanyModel.fromJson(Map<String,dynamic> json){
    return CompanyModel(
        department: json["department"],
        name: json["name"],
        title: json["title"],
        address: AddressModel.fromJson(json["address"])
    );
  }


}