import 'package:flutter/material.dart';
import 'package:graduation_project/core/router.dart';
import 'package:graduation_project/relockMaker/chat/view.dart';

import '../../../constants.dart';

class MakerChatsCard extends StatelessWidget {
  final String name;
  final String date;
  final int id;
  const MakerChatsCard({this.name, this.date, this.id});
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: ()=> MagicRouter.navigateTo(MakerChatView(
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
                  maxRadius: 35,
                  backgroundColor: Colors.green,
                  child:CircleAvatar(
                    maxRadius: 33,
                    backgroundColor: kTextColor,
                  ),
                ),
                SizedBox(width: 15,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(name,style: TextStyle(color:Colors.black,fontSize: 18, fontFamily: "dinnextl bold",),),
                    date!=null?Text(date,style: TextStyle(color:Colors.black,fontSize: 18, fontFamily: "dinnextl bold",),)
                        :SizedBox(),
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
