// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
    this.msg,
    this.apiToken,
    this.data,
  });

  String msg;
  String apiToken;
  Data data;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    msg: json["msg"],
    apiToken: json["api_token"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "msg": msg,
    "api_token": apiToken,
    "data": data.toJson(),
  };
}

class Data {
  Data({
    this.user,
  });

  User user;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    user: User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "user": user.toJson(),
  };
}

class User {
  User({
    this.id,
    this.firstName,
    this.lastName,
    this.type,
    this.email,
    this.apiToken,
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String firstName;
  String lastName;
  String type;
  String email;
  String apiToken;
  String image;
  DateTime createdAt;
  DateTime updatedAt;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    type: json["type"],
    email: json["email"],
    apiToken: json["api_token"],
    image: json["image"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "first_name": firstName,
    "last_name": lastName,
    "type": type,
    "email": email,
    "api_token": apiToken,
    "image": image,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
