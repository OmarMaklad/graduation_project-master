import 'package:flutter/material.dart';
import 'package:graduation_project/CustomService/home/controller.dart';
import 'package:graduation_project/CustomService/home/models/AllChatsModel.dart';
import 'package:graduation_project/CustomService/home/widgets/chats_card.dart';
import 'package:graduation_project/widgets/appBar.dart';
import 'package:graduation_project/widgets/loading_indicator.dart';

import '../../../constants.dart';

class ServiceAllChatsView extends StatefulWidget {
  @override
  _ServiceAllChatsViewState createState() => _ServiceAllChatsViewState();
}

class _ServiceAllChatsViewState extends State<ServiceAllChatsView> {
  bool _isLoading = true;
  ServiceAllChatsModel _serviceAllChatsModel;
  initState(){
    getChats();
    super.initState();
  }
  getChats()async{
    _serviceAllChatsModel = await ServiceHomeController().getChats();
    setState(()=> _isLoading = false);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Column(
        children: [
          CustomAppBar(title: "Chats",),
          Expanded(child:_isLoading ? LoadingIndicator() :
          ListView.separated(
            itemBuilder:(ctx,index){
              final chat = _serviceAllChatsModel.data[index];
              return ServiceChatsCard(
                id: chat.conversationId,
                name: chat.sender.firstName,
                date: chat.updatedAt.toString(),
              );
            },
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            separatorBuilder: (ctx,ind)=>SizedBox(height:10,),
            itemCount: _serviceAllChatsModel.data.length,
          )
          ),
        ],
      ),
    );
  }
}
