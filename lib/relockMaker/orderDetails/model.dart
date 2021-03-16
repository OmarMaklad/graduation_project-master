// To parse this JSON data, do
//
//     final makerOrderDetailsModel = makerOrderDetailsModelFromJson(jsonString);

import 'dart:convert';

MakerOrderDetailsModel makerOrderDetailsModelFromJson(String str) => MakerOrderDetailsModel.fromJson(json.decode(str));

String makerOrderDetailsModelToJson(MakerOrderDetailsModel data) => json.encode(data.toJson());

class MakerOrderDetailsModel {
  MakerOrderDetailsModel({
    this.msg,
    this.data,
  });

  String msg;
  Data data;

  factory MakerOrderDetailsModel.fromJson(Map<String, dynamic> json) => MakerOrderDetailsModel(
    msg: json["msg"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "msg": msg,
    "data": data.toJson(),
  };
}

class Data {
  Data({
    this.id,
    this.buyerId,
    this.buyerFirstName,
    this.buyerLastName,
    this.sealerId,
    this.sealerFirstName,
    this.sealerLastName,
    this.productId,
    this.productName,
    this.productImage,
    this.status,
    this.desc,
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  int buyerId;
  String buyerFirstName;
  String buyerLastName;
  int sealerId;
  String sealerFirstName;
  String sealerLastName;
  int productId;
  String productName;
  String productImage;
  int status;
  String desc;
  dynamic image;
  DateTime createdAt;
  DateTime updatedAt;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    buyerId: json["buyer_id"],
    buyerFirstName: json["buyer_first_name"],
    buyerLastName: json["buyer_last_name"],
    sealerId: json["sealer_id"],
    sealerFirstName: json["sealer_first_name"],
    sealerLastName: json["sealer_last_name"],
    productId: json["product_id"],
    productName: json["product_name"],
    productImage: json["product_image"],
    status: json["status"],
    desc: json["desc"],
    image: json["image"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "buyer_id": buyerId,
    "buyer_first_name": buyerFirstName,
    "buyer_last_name": buyerLastName,
    "sealer_id": sealerId,
    "sealer_first_name": sealerFirstName,
    "sealer_last_name": sealerLastName,
    "product_id": productId,
    "product_name": productName,
    "product_image": productImage,
    "status": status,
    "desc": desc,
    "image": image,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
