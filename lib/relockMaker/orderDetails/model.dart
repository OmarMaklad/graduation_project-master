class MakerOrderDetailsModel {
  String msg;
  Data data;

  MakerOrderDetailsModel({this.msg, this.data});

  MakerOrderDetailsModel.fromJson(Map<String, dynamic> json) {
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
  Null image;
  int days;
  String createdAt;
  String updatedAt;

  Data(
      {this.id,
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
        this.days,
        this.createdAt,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    buyerId = json['buyer_id'];
    buyerFirstName = json['buyer_first_name'];
    buyerLastName = json['buyer_last_name'];
    sealerId = json['sealer_id'];
    sealerFirstName = json['sealer_first_name'];
    sealerLastName = json['sealer_last_name'];
    productId = json['product_id'];
    productName = json['product_name'];
    productImage = json['product_image'];
    status = json['status'];
    desc = json['desc'];
    image = json['image'];
    days = json['days'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['buyer_id'] = this.buyerId;
    data['buyer_first_name'] = this.buyerFirstName;
    data['buyer_last_name'] = this.buyerLastName;
    data['sealer_id'] = this.sealerId;
    data['sealer_first_name'] = this.sealerFirstName;
    data['sealer_last_name'] = this.sealerLastName;
    data['product_id'] = this.productId;
    data['product_name'] = this.productName;
    data['product_image'] = this.productImage;
    data['status'] = this.status;
    data['desc'] = this.desc;
    data['image'] = this.image;
    data['days'] = this.days;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
