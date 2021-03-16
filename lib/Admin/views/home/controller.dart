import 'package:dio/dio.dart';
import 'package:graduation_project/Admin/views/home/models/all_chats.dart';
import 'package:graduation_project/core/network/network.dart';

import '../../../constants.dart';

class AdminHomeController {

  AdminAllChatsModel _adminAllChatsModel = AdminAllChatsModel();

  Future<AdminAllChatsModel> getChats()async{
    final id = loggedUser.id;
    Map<String, dynamic> _body = {
      "user_id": id,
    };
    FormData _formData = FormData.fromMap(_body);
    var response =
    await NetWork().postData(url: 'getListChatByUser_id', formData: _formData,);
    if (response !=null) {
      _adminAllChatsModel = AdminAllChatsModel.fromJson(response);
    }
    return _adminAllChatsModel;
  }

}