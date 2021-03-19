class AddModel {
  String msg;
  String data;

  AddModel({this.msg, this.data});

  AddModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this.msg;
    data['data'] = this.data;
    return data;
  }
}
