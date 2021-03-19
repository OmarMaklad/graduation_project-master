import 'package:flutter/material.dart';
import 'package:graduation_project/relockMaker/allChats/model/AllChatsModel.dart';
import 'package:graduation_project/relockMaker/home/controller.dart';
import 'package:graduation_project/relockMaker/home/widgets/chat_card.dart';
import 'package:graduation_project/widgets/appBar.dart';
import 'package:graduation_project/widgets/loading_indicator.dart';
import '../../../constants.dart';

class ReLockMakerAllChatsView extends StatefulWidget {
  @override
  _ReLockMakerAllChatsViewState createState() => _ReLockMakerAllChatsViewState();
}

class _ReLockMakerAllChatsViewState extends State<ReLockMakerAllChatsView> {
  bool _isLoading = true;
  MakerAllChatsModel _makerAllChatsModel;
  initState(){
    getChats();
    super.initState();
  }
  getChats()async{
    _makerAllChatsModel = await MakerHomeController().getChats();
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
              final chat = _makerAllChatsModel.data[index];
              return MakerChatsCard(
                id: chat.conversationId,
                name: chat.receiver.firstName + ' ' + chat.receiver.lastName,
                date: chat.updatedAt.toString(),
              );
            },
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            separatorBuilder: (ctx,ind)=>SizedBox(height:10,),
            itemCount: _makerAllChatsModel.data.length,
          )
          ),
        ],
      ),
    );
  }
}
