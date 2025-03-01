class BankModel {
  String? cardExpire;
  String? cardNumber;
  String? cardType;

  String? currency;
  String? iban;

  BankModel({
     this.cardExpire,
     this.cardNumber,
     this.cardType,
     this.currency,
     this.iban,
  });

  factory BankModel.fromJson(Map<String, dynamic> json) {
    return BankModel(
        cardExpire: json["cardExpire"],
        cardNumber: json["cardNumber"],
        cardType: json["cardType"],
        currency: json["currency"],
        iban: json["iban"]);
  }
}
