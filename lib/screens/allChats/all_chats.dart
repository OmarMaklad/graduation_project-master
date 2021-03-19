import 'package:flutter/material.dart';
import 'package:graduation_project/screens/allChats/chats_card.dart';
import 'package:graduation_project/screens/allChats/controller.dart';
import 'package:graduation_project/screens/allChats/model.dart';
import 'package:graduation_project/widgets/appBar.dart';
import 'package:graduation_project/widgets/loading_indicator.dart';

import '../../constants.dart';

class BuyerAllChatsView extends StatefulWidget {
  @override
  _BuyerAllChatsViewState createState() => _BuyerAllChatsViewState();
}

class _BuyerAllChatsViewState extends State<BuyerAllChatsView> {
  bool _isLoading = true;
  BuyerAllChatsModel _buyerAllChatsModel;
  initState(){
    getChats();
    super.initState();
  }
  getChats()async{
    _buyerAllChatsModel = await BuyerAllChatController().getChats();
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
              final chat = _buyerAllChatsModel.data[index];
              return BuyerChatsCard(
                id: chat.conversationId,
                name: chat.receiver.firstName + ' ' + chat.receiver.lastName,
                date: chat.updatedAt.toString(),
              );
            },
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            separatorBuilder: (ctx,ind)=>SizedBox(height:10,),
            itemCount: _buyerAllChatsModel.data.length,
          )
          ),
        ],
      ),
    );
  }
}
