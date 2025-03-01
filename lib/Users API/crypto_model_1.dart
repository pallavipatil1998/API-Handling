class CryptoModel{
  String? coin;
  String? network ;
  String? wallet;

  CryptoModel({
     this.coin,
     this.network,
     this.wallet
});

  factory CryptoModel.fromJson(Map<String,dynamic> json){
    return CryptoModel(
        coin: json["coin"],
        network: json["network"],
        wallet: json["wallet"]);
  }


}