import 'package:api_handling/Users%20API/coordinates_model_2.dart';

class AddressModel{
  String? address;
  String? city;
  String? country;
  String? postalCode;
  String? state;
  String? stateCode;
  CoordinatesModel? coordinates ;

  AddressModel({
     this.address,
     this.city,
     this.country,
     this.state,
     this.postalCode,
     this.stateCode,
     this.coordinates
});


  factory AddressModel.fromJson(Map<String,dynamic> json){

    return AddressModel(
        address: json["address"],
        city: json["city"],
        country: json["country"],
        state: json["state"],
        postalCode: json["postalCode"],
        stateCode: json["stateCode"],
        coordinates: CoordinatesModel.fromJson(json["coordinates"]),
    );
  }


}