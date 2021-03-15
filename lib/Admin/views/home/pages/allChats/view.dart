import 'package:flutter/material.dart';
import 'package:graduation_project/Admin/views/home/pages/allChats/chatCard.dart';
import 'package:graduation_project/widgets/appBar.dart';
import '../../../../../constants.dart';
import 'chatsList.dart';

class AllChats extends StatelessWidget {
  final String title;
  final bool admin;
   AllChats({ this.title, this.admin});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Column(
        children: [
          CustomAppBar(title:title,),
        admin==true? ChatsCard(text: "Admin",):SizedBox(),
          Expanded(child: AllChatsList()),
        ],
      ),
    );
  }
}
