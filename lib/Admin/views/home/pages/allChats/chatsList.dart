import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'chatCard.dart';


class AllChatsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return  ListView.separated(
      itemBuilder:(ctx,index)=>ChatsCard(),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      separatorBuilder: (ctx,ind)=>SizedBox(height:10,),
      itemCount:10,
    );
  }
}
