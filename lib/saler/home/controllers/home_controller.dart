import 'package:dio/dio.dart';
import 'package:graduation_project/constants.dart';
import 'package:graduation_project/core/network/network.dart';
import 'package:graduation_project/saler/home/models/AllChatsModel.dart';

class SalerHomeController {

  SalerAllChatsModel _salerAllChatsModel = SalerAllChatsModel();

  Future<SalerAllChatsModel> getChats()async{
    final id = loggedUser.id;
    Map<String, dynamic> _body = {
      "user_id": id,
    };
    FormData _formData = FormData.fromMap(_body);
    var response = await NetWork().postData(url: 'getListChatByUser_id', formData: _formData,);
    if (response !=null) {
      _salerAllChatsModel = SalerAllChatsModel.fromJson(response);
    }
    return _salerAllChatsModel;
  }

}