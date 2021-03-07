import 'package:flutter/material.dart';
import 'package:graduation_project/widgets/appBar.dart';
import '../../../../../constants.dart';
import 'chatsList.dart';

class AllChats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Column(
        children: [
          CustomAppBar(title: "Chats",),
          Expanded(child: AllChatsList()),
        ],
      ),
    );
  }
}
