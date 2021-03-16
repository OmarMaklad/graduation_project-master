// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'chatCard.dart';
// import 'model/AllChatsModel.dart';
//
// class AllChatsList extends StatelessWidget {
//   final MakerAllChatsModel allChatsModel;
//    AllChatsList({ this.allChatsModel}) ;
//   @override
//   Widget build(BuildContext context) {
//     return  Padding(
//       padding: EdgeInsets.symmetric(vertical: 20),
//       child: ListView.separated(
//         itemBuilder:(ctx,index)=>
//             ChatsCard(
//           name: allChatsModel.data[index].sender.userName,
//           date: allChatsModel.data[index].sender.createdAt,chatId: allChatsModel.data[index].id,
//           image: 'assets/images/doc.png',
//         ),
//         shrinkWrap: true,
//         scrollDirection: Axis.vertical,
//         separatorBuilder: (ctx,ind)=>SizedBox(height:10,),
//         itemCount:allChatsModel.data.length,
//       ),
//     );
//   }
// }
