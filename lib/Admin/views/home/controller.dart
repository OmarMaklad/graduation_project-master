import 'package:dio/dio.dart';
import 'package:graduation_project/Admin/views/home/models/all_chats.dart';
import 'package:graduation_project/Admin/views/home/models/products.dart';
import 'package:graduation_project/core/network/network.dart';

import '../../../constants.dart';

class AdminHomeController {

  AdminAllChatsModel _adminAllChatsModel = AdminAllChatsModel();
  AdminProductsModel _adminProductsModel = AdminProductsModel();

  Future<AdminProductsModel> getProducts()async{
    final response = await dioGet('products');
    _adminProductsModel = AdminProductsModel.fromJson(response.data);
    return _adminProductsModel;
  }

  Future<void> acceptOrder(int id)async{
    await dioPost('acceptproduct',body: {'product_id':id});
  }

  Future<void> cancelOrder(int id)async{
    await dioPost('refuseproduct',body: {'product_id':id});
  }

  Future<void> notify(String path,String body)async{
   final response = await dioPost(path,body: {'body':body});
   print(response);
  }

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