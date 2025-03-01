class MetaModel {
  String? barcode;
  String? createdAt;
  String? qrCode;
  String? updatedAt;

  MetaModel(
      {
        this.barcode,
       this.createdAt,
       this.qrCode,
       this.updatedAt});

  factory MetaModel.fromJson(Map<String, dynamic> json) {
    return MetaModel(
        barcode: json["barcode"],
        createdAt: json["createdAt"],
        qrCode: json["qrCode"],
        updatedAt: json["updatedAt"]);
  }
}
