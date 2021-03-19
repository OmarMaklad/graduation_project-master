class AddToMakerModel {
  String msg;
  Data data;

  AddToMakerModel({this.msg, this.data});

  AddToMakerModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  int buyerId;
  int sealerId;
  String productId;
  String desc;
  String updatedAt;
  String createdAt;
  int id;

  Data(
      {this.buyerId,
        this.sealerId,
        this.productId,
        this.desc,
        this.updatedAt,
        this.createdAt,
        this.id});

  Data.fromJson(Map<String, dynamic> json) {
    buyerId = json['buyer_id'];
    sealerId = json['sealer_id'];
    productId = json['product_id'];
    desc = json['desc'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['buyer_id'] = this.buyerId;
    data['sealer_id'] = this.sealerId;
    data['product_id'] = this.productId;
    data['desc'] = this.desc;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}
