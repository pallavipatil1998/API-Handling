import 'package:api_handling/Users%20API/address_model_3.dart';

class CompanyModel{
  String department;
  String name;
  String title;
  List<AddressModel> address;

  CompanyModel({
    required this.department,
    required this.name,
    required this.title,
    required this.address,

});

  factory CompanyModel.fromJson(Map<String,dynamic> json){
    List<AddressModel> mAddress=[];
    for(Map<String,dynamic> eachAddress in json["address"]){
      mAddress.add(AddressModel.fromJson(eachAddress));
    }

    return CompanyModel(
        department: json["department"],
        name: json["name"],
        title: json["title"],
        address: mAddress
    );
  }


}