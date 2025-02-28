import 'package:api_handling/Users%20API/coordinates_model_2.dart';

class AddressModel{
  String address;
  String city;
  String country;
  String postalCode;
  String state;
  String stateCode;
  List<CoordinatesModel> coordinates=[];

  AddressModel({
    required this.address,
    required this.city,
    required this.country,
    required this.state,
    required this.postalCode,
    required this.stateCode,
    required this.coordinates
});


  factory AddressModel.fromJson(Map<String,dynamic> json){
    List<CoordinatesModel> mCoordinates=[];
    for(Map<String,dynamic>eachCoordinate in json["coordinates"]){
      mCoordinates.add(CoordinatesModel.fromJson(eachCoordinate));
    }

    return AddressModel(
        address: json["address"],
        city: json["city"],
        country: json["country"],
        state: json["state"],
        postalCode: json["postalCode"],
        stateCode: json["stateCode"],
        coordinates: mCoordinates
    );
  }


}