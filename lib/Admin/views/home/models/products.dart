// To parse this JSON data, do
//
//     final adminProductsModel = adminProductsModelFromJson(jsonString);

import 'dart:convert';

AdminProductsModel adminProductsModelFromJson(String str) => AdminProductsModel.fromJson(json.decode(str));

String adminProductsModelToJson(AdminProductsModel data) => json.encode(data.toJson());

class AdminProductsModel {
  AdminProductsModel({
    this.msg,
    this.data,
  });

  String msg;
  List<Datum> data;

  factory AdminProductsModel.fromJson(Map<String, dynamic> json) => AdminProductsModel(
    msg: json["msg"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "msg": msg,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    this.id,
    this.name,
    this.price,
    this.sealerId,
    this.sealerFirstName,
    this.sealerLastName,
    this.image,
    this.status,
    this.desc,
    this.category,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String name;
  String price;
  int sealerId;
  String sealerFirstName;
  String sealerLastName;
  String image;
  int status;
  String desc;
  String category;
  DateTime createdAt;
  DateTime updatedAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    name: json["name"],
    price: json["price"],
    sealerId: json["sealer_id"],
    sealerFirstName: json["sealer_first_name"],
    sealerLastName: json["sealer_last_name"],
    image: json["image"],
    status: json["status"],
    desc: json["desc"],
    category: json["category"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "price": price,
    "sealer_id": sealerId,
    "sealer_first_name": sealerFirstName,
    "sealer_last_name": sealerLastName,
    "image": image,
    "status": status,
    "desc": desc,
    "category": category,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
