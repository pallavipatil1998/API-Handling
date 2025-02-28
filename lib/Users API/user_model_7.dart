import 'package:api_handling/Users%20API/address_model_3.dart';
import 'package:api_handling/Users%20API/hair_model_6.dart';

import 'bank_model_5.dart';
import 'company_model_4.dart';
import 'crypto_model_1.dart';

class UserModel {
  AddressModel address;
  int age;
  BankModel bank;
  String birthDate;
  String bloodGroup;
  CompanyModel company;
  CryptoModel crypto;
  String ein;
  String email;
  String eyeColor;
  String firstName;
  String gender;
  HairModel hair;
  double height;
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
  double weight;

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

    return UserModel(
        address: AddressModel.fromJson(json["address"]),
        id: json["id"],
        email: json["email"],
        gender: json["gender"],
        height: json["height"],
        password: json["password"],
        age: json["age"],
        bank: BankModel.fromJson(json["bank"],),
        birthDate: json["birthDate"],
        bloodGroup: json["bloodGroup"],
        company: CompanyModel.fromJson(json["company"]),
        crypto: CryptoModel.fromJson(json["crypto"]),
        ein: json["ein"],
        eyeColor: json["eyeColor"],
        firstName: json["firstName"],
        hair:HairModel.fromJson( json["hair"]),
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