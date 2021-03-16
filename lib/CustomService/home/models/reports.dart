// To parse this JSON data, do
//
//     final serviceReportsModel = serviceReportsModelFromJson(jsonString);

import 'dart:convert';

ServiceReportsModel serviceReportsModelFromJson(String str) => ServiceReportsModel.fromJson(json.decode(str));

String serviceReportsModelToJson(ServiceReportsModel data) => json.encode(data.toJson());

class ServiceReportsModel {
  ServiceReportsModel({
    this.msg,
    this.data,
  });

  String msg;
  List<Datum> data;

  factory ServiceReportsModel.fromJson(Map<String, dynamic> json) => ServiceReportsModel(
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
    this.phone,
    this.message,
    this.userId,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String name;
  String phone;
  String message;
  int userId;
  DateTime createdAt;
  DateTime updatedAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    name: json["name"],
    phone: json["phone"],
    message: json["message"],
    userId: json["user_id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "phone": phone,
    "message": message,
    "user_id": userId,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
