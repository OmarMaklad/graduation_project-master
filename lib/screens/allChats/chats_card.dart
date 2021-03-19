import 'package:flutter/material.dart';
import 'package:graduation_project/core/router.dart';
import 'package:graduation_project/screens/chat/view.dart';

import '../../constants.dart';

class BuyerChatsCard extends StatelessWidget {
  final String name;
  final String date;
  final int id;
  const BuyerChatsCard({this.name, this.date, this.id});
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: ()=> MagicRouter.navigateTo(BuyerChatView(
        date: date,
        name: name,
        chatId: id,
      )),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 15),
        padding: EdgeInsets.symmetric(horizontal: 20),
        height: height*.12,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  maxRadius: 20,
                  backgroundColor: Colors.green,
                  child:CircleAvatar(
                    maxRadius: 33,
                    backgroundColor: kTextColor,
                  ),
                ),
                SizedBox(width: 15,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name,style: TextStyle(color:Colors.black,fontSize: 18, fontFamily: "dinnextl bold",),),
                    Text(date,style: TextStyle(color:Colors.black,fontSize: 12, fontFamily: "dinnextl bold",),)
                  ],
                ),

              ],
            ),
            Icon(Icons.keyboard_arrow_right,size:30,),
          ],
        ),
      ),
    );
  }
}
