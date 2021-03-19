class SealerOrdersModel {
  String msg;
  List<Data> data;

  SealerOrdersModel({this.msg, this.data});

  SealerOrdersModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int id;
  int sealerId;
  int buyerId;
  String buyerFirstName;
  String buyerLastName;
  int productId;
  String productName;
  String productPrice;
  String productImage;
  int status;
  String createdAt;
  String updatedAt;

  Data(
      {this.id,
        this.sealerId,
        this.buyerId,
        this.buyerFirstName,
        this.buyerLastName,
        this.productId,
        this.productName,
        this.productPrice,
        this.productImage,
        this.status,
        this.createdAt,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sealerId = json['sealer_id'];
    buyerId = json['buyer_id'];
    buyerFirstName = json['buyer_first_name'];
    buyerLastName = json['buyer_last_name'];
    productId = json['product_id'];
    productName = json['product_name'];
    productPrice = json['product_price'];
    productImage = json['product_image'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['sealer_id'] = this.sealerId;
    data['buyer_id'] = this.buyerId;
    data['buyer_first_name'] = this.buyerFirstName;
    data['buyer_last_name'] = this.buyerLastName;
    data['product_id'] = this.productId;
    data['product_name'] = this.productName;
    data['product_price'] = this.productPrice;
    data['product_image'] = this.productImage;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
