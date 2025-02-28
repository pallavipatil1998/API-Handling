import 'package:api_handling/Users%20API/address_model_3.dart';
import 'package:api_handling/Users%20API/hair_model_6.dart';

import 'bank_model_5.dart';
import 'company_model_4.dart';
import 'crypto_model_1.dart';

class UserModel {
  List<AddressModel> address;
  int age;
  List<BankModel> bank;
  String birthDate;
  String bloodGroup;
  List<CompanyModel> company;
  List<CryptoModel> crypto;
  String ein;
  String email;
  String eyeColor;
  String firstName;
  String gender;
  List<HairModel> hair;
  int height;
  int id;
  String image;
  String ip;
  String lastName;
  String macAddress;
  String maidenName;
  String password;
  String phone;
  String role;
  String ssn;
  String university;
  String userAgent;
  String username;
  int weight;

  UserModel({
    required this.address,
    required this.id,
    required this.email,
    required this.gender,
    required this.height,
    required this.password,
    required this.age,
    required this.bank,
    required this.birthDate,
    required this.bloodGroup,
    required this.company,
    required this.crypto,
    required this.ein,
    required this.eyeColor,
    required this.firstName,
    required this.hair,
    required this.image,
    required this.ip,
    required this.lastName,
    required this.macAddress,
    required this.maidenName,
    required this.phone,
    required this.role,
    required this.ssn,
    required this.university,
    required this.userAgent,
    required this.username,
    required this.weight,
  });


  factory UserModel.fromJson(Map<String, dynamic> json){
    List<AddressModel> mAddress=[];
    List<BankModel> mBank=[];
    List<CompanyModel> mCompany=[];
    List<CryptoModel> mCrypto=[];
    List<HairModel> mHair=[];

    for(Map<String,dynamic> eachAdress in json["address"]){

      mAddress.add(AddressModel.fromJson(eachAdress));

    }

    for(Map<String,dynamic> eachBank in json["bank"]){
      mBank.add(BankModel.fromJson(eachBank));

    }
    for(Map<String,dynamic> eachCompany in json["company"]){
      mCompany.add(CompanyModel.fromJson(eachCompany));

    }
    for(Map<String,dynamic> eachCrypto in json["crypto"]){
      mCrypto.add(CryptoModel.fromJson(eachCrypto));

    }
    for(Map<String,dynamic> eachHair in json["hair"]){
      mHair.add(HairModel.fromJson(eachHair));

    }


    return UserModel(
        address: mAddress,
        id: json["id"],
        email: json["email"],
        gender: json["gender"],
        height: json["height"],
        password: json["password"],
        age: json["age"],
        bank: mBank,
        birthDate: json["birthDate"],
        bloodGroup: json["bloodGroup"],
        company: mCompany,
        crypto: mCrypto,
        ein: json["ein"],
        eyeColor: json["eyeColor"],
        firstName: json["firstName"],
        hair: mHair,
        image: json["image"],
        ip: json["ip"],
        lastName: json["lastName"],
        macAddress: json["macAddress"],
        maidenName: json["maidenName"],
        phone: json["phone"],
        role: json["role"],
        ssn: json["ssn"],
        university: json["university"],
        userAgent: json["userAgent"],
        username: json["username"],
        weight: json["weight"]
    );
  }

}