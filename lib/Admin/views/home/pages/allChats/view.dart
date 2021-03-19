import 'package:flutter/material.dart';
import 'package:graduation_project/Admin/views/home/controller.dart';
import 'package:graduation_project/Admin/views/home/models/all_chats.dart';
import 'package:graduation_project/Admin/views/home/pages/allChats/chats_card.dart';
import 'package:graduation_project/CustomService/home/controller.dart';
import 'package:graduation_project/widgets/appBar.dart';
import 'package:graduation_project/widgets/loading_indicator.dart';

import '../../../../../constants.dart';


class AdminAllChatsView extends StatefulWidget {
  @override
  _AdminAllChatsViewState createState() => _AdminAllChatsViewState();
}

class _AdminAllChatsViewState extends State<AdminAllChatsView> {
  bool _isLoading = true;
  AdminAllChatsModel _adminAllChatsModel;
  initState(){
    getChats();
    super.initState();
  }
  getChats()async{
    _adminAllChatsModel = await AdminHomeController().getChats();
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
              final chat = _adminAllChatsModel.data[index];
              return AdminChatsCard(
                id: chat.conversationId,
                name: chat.receiver.firstName + ' ' + chat.receiver.lastName,
                date: chat.updatedAt.toString(),
              );
            },
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            separatorBuilder: (ctx,ind)=>SizedBox(height:10,),
            itemCount: _adminAllChatsModel.data.length,
          )
          ),
        ],
      ),
    );
  }
}