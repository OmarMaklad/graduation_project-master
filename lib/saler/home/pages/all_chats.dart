import 'package:flutter/material.dart';
import 'package:graduation_project/saler/home/controllers/home_controller.dart';
import 'package:graduation_project/saler/home/models/AllChatsModel.dart';
import 'package:graduation_project/saler/home/widgets/chats_card.dart';
import 'package:graduation_project/widgets/appBar.dart';
import 'package:graduation_project/widgets/loading_indicator.dart';

import '../../../constants.dart';

class SalerAllChatsView extends StatefulWidget {
  @override
  _SalerAllChatsViewState createState() => _SalerAllChatsViewState();
}

class _SalerAllChatsViewState extends State<SalerAllChatsView> {
  bool _isLoading = true;
  SalerAllChatsModel _serviceAllChatsModel;
  initState(){
    getChats();
    super.initState();
  }
  getChats()async{
    _serviceAllChatsModel = await SalerHomeController().getChats();
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
              return SalerChatsCard(
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
