import 'package:dio/dio.dart';
import 'package:graduation_project/constants.dart';
import 'package:graduation_project/core/network/network.dart';
import 'package:graduation_project/relockMaker/allChats/model/AllChatsModel.dart';
import 'package:graduation_project/relockMaker/home/models/orders.dart';

class MakerHomeController {

  MakerOrdersModel _makerOrdersModel = MakerOrdersModel();
  MakerAllChatsModel _makerAllChatsModel = MakerAllChatsModel();
  Future<MakerOrdersModel> getOrders()async{
    final response = await dioGet('maker_orders');
    _makerOrdersModel = MakerOrdersModel.fromJson(response.data);
    return _makerOrdersModel;
  }

  Future<MakerAllChatsModel> getChats()async{
    final id = loggedUser.id;
    Map<String, dynamic> _body = {
      "user_id": id,
    };
    FormData _formData = FormData.fromMap(_body);
    var response =
    await NetWork().postData(url: 'getConversationByUser_id', formData: _formData,);
    print(response);
    if (response !=null) {
      _makerAllChatsModel = MakerAllChatsModel.fromJson(response);
    }
    return _makerAllChatsModel;
  }

}