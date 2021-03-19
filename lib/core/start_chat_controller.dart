import 'package:dio/dio.dart';
import 'package:graduation_project/constants.dart';
import 'package:graduation_project/core/network/network.dart';

class StartChatController {

  NetWork _netWork = NetWork();

  Future<int> startChat(int receiverId)async{
    final id = loggedUser.id;
    final formData = FormData.fromMap({
      'sender_id': id,
      'receiver_id': receiverId,
      'massage': 'Hello'
    });
    final response = await _netWork.postData(url: 'addConversation',formData: formData);
    return response['data'][0]['conversation_id'];
  }

}