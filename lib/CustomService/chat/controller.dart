import 'dart:io';
import 'package:dio/dio.dart';
import 'package:graduation_project/constants.dart';
import 'package:graduation_project/core/network/network.dart';
import 'model.dart';

class ServiceChatController {
  ServiceChatModel _chatModel =ServiceChatModel();
  NetWork _netWork = NetWork();
  Future<ServiceChatModel> getMessage(int id) async {
    Map<String, dynamic> _body = {
      "conversation_id": id,
    };
    FormData _formData = FormData.fromMap(_body);
    var response =
    await _netWork.postData(url: 'getConversationById', formData: _formData,);
    print(response);
    if (response !=null) {
      _chatModel = ServiceChatModel.fromJson(response);
    } else {
      _chatModel = ServiceChatModel();
    }
    _chatModel.data = _chatModel.data.reversed.toList();
    return _chatModel;
  }

  Future<void> sendMessage({File file,int senderId,String message,int conversationId,int receiverId})async{
    int id = loggedUser.id;
    FormData _formData = FormData.fromMap({
      "sender_id": id,
      "receiver_id": receiverId,
      "type": message == null ? 1 : 0,
      if(message != null)
        'massage': message,
      if(file != null)
        'file': await MultipartFile.fromFile(file.path),
      'conversation_id': conversationId,
    });
    await _netWork.postData(url: 'addMassage',formData: _formData);
  }
}