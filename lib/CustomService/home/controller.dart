import 'package:dio/dio.dart';
import 'package:graduation_project/CustomService/home/models/AllChatsModel.dart';
import 'package:graduation_project/CustomService/home/models/reports.dart';
import 'package:graduation_project/constants.dart';
import 'package:graduation_project/core/network/network.dart';

class ServiceHomeController {

  Future<ServiceReportsModel> getReports()async{
    final response = await dioGet('reports');
    ServiceReportsModel _serviceReportsModel = ServiceReportsModel.fromJson(response.data);
    return _serviceReportsModel;
  }

  ServiceAllChatsModel _serviceAllChatsModel = ServiceAllChatsModel();

  Future<ServiceAllChatsModel> getChats()async{
    final id = loggedUser.id;
    Map<String, dynamic> _body = {
      "user_id": id,
    };
    FormData _formData = FormData.fromMap(_body);
    var response =
    await NetWork().postData(url: 'getListChatByUser_id', formData: _formData,);
    if (response !=null) {
      _serviceAllChatsModel = ServiceAllChatsModel.fromJson(response);
    }
    return _serviceAllChatsModel;
  }

}