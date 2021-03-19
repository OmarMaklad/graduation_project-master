class HomeModel {
  String msg;
  List<Data> data;

  HomeModel({this.msg, this.data});

  HomeModel.fromJson(Map<String, dynamic> json) {
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
  String name;
  String price;
  int sealerId;
  String image;
  int status;
  String desc;
  String category;
  String createdAt;
  String updatedAt;
  String sealerFirstName;
  String sealerLastName;

  Data(
      {this.id,
        this.name,
        this.price,
        this.sealerId,
        this.image,
        this.status,
        this.desc,
        this.category,
        this.createdAt,
        this.updatedAt,
        this.sealerFirstName,
        this.sealerLastName});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    sealerId = json['sealer_id'];
    image = json['image'];
    status = json['status'];
    desc = json['desc'];
    category = json['category'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    sealerFirstName = json['sealer_first_name'];
    sealerLastName = json['sealer_last_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['price'] = this.price;
    data['sealer_id'] = this.sealerId;
    data['image'] = this.image;
    data['status'] = this.status;
    data['desc'] = this.desc;
    data['category'] = this.category;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['sealer_first_name'] = this.sealerFirstName;
    data['sealer_last_name'] = this.sealerLastName;
    return data;
  }
}
