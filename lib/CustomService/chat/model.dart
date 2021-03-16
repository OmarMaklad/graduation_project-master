// To parse this JSON data, do
//
//     final serviceChatModel = serviceChatModelFromJson(jsonString);

import 'dart:convert';

ServiceChatModel serviceChatModelFromJson(String str) => ServiceChatModel.fromJson(json.decode(str));

String serviceChatModelToJson(ServiceChatModel data) => json.encode(data.toJson());

class ServiceChatModel {
  ServiceChatModel({
    this.msg,
    this.data,
  });

  String msg;
  List<Datum> data;

  factory ServiceChatModel.fromJson(Map<String, dynamic> json) => ServiceChatModel(
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
    this.senderId,
    this.receiverId,
    this.conversationId,
    this.massage,
    this.file,
    this.type,
    this.createdAt,
    this.updatedAt,
    this.sender,
    this.receiver,
  });

  int id;
  int senderId;
  int receiverId;
  int conversationId;
  String massage;
  dynamic file;
  int type;
  DateTime createdAt;
  DateTime updatedAt;
  Receiver sender;
  Receiver receiver;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    senderId: json["sender_id"],
    receiverId: json["receiver_id"],
    conversationId: json["conversation_id"],
    massage: json["massage"],
    file: json["file"],
    type: json["type"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    sender: Receiver.fromJson(json["sender"]),
    receiver: Receiver.fromJson(json["receiver"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "sender_id": senderId,
    "receiver_id": receiverId,
    "conversation_id": conversationId,
    "massage": massage,
    "file": file,
    "type": type,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "sender": sender.toJson(),
    "receiver": receiver.toJson(),
  };
}

class Receiver {
  Receiver({
    this.id,
    this.firstName,
    this.lastName,
    this.type,
    this.email,
    this.emailVerifiedAt,
    this.apiToken,
    this.googleToken,
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String firstName;
  String lastName;
  String type;
  String email;
  dynamic emailVerifiedAt;
  String apiToken;
  dynamic googleToken;
  String image;
  DateTime createdAt;
  DateTime updatedAt;

  factory Receiver.fromJson(Map<String, dynamic> json) => Receiver(
    id: json["id"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    type: json["type"],
    email: json["email"],
    emailVerifiedAt: json["email_verified_at"],
    apiToken: json["api_token"],
    googleToken: json["google_token"],
    image: json["image"] == null ? null : json["image"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "first_name": firstName,
    "last_name": lastName,
    "type": type,
    "email": email,
    "email_verified_at": emailVerifiedAt,
    "api_token": apiToken,
    "google_token": googleToken,
    "image": image == null ? null : image,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
