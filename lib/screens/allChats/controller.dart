import 'package:dio/dio.dart';
import 'package:graduation_project/constants.dart';
import 'package:graduation_project/core/network/network.dart';
import 'package:graduation_project/screens/allChats/model.dart';

class BuyerAllChatController {

  BuyerAllChatsModel _buyerAllChatsModel = BuyerAllChatsModel();

  Future<BuyerAllChatsModel> getChats()async{
    final id = loggedUser.id;
    Map<String, dynamic> _body = {
      "user_id": id,
    };
    FormData _formData = FormData.fromMap(_body);
    var response =
    await NetWork().postData(url: 'getListChatByUser_id', formData: _formData,);
    if (response !=null) {
      _buyerAllChatsModel = BuyerAllChatsModel.fromJson(response);
    }
    print(_buyerAllChatsModel.data.length);
    print(loggedUser.id);
    return _buyerAllChatsModel;
  }

}