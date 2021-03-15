import 'package:flutter/material.dart';

import '../../../../../constants.dart';


class ChatsCard extends StatelessWidget {
  final String text;

  const ChatsCard({Key key, this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Container(
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
                  Text("Sara",style: TextStyle(color:Colors.black,fontSize: 18, fontFamily: "dinnextl bold",),),
                 text!=null?Text(text,style: TextStyle(color:Colors.black,fontSize: 18, fontFamily: "dinnextl bold",),)
                  :SizedBox(),
                ],
              ),

            ],
          ),
          Icon(Icons.keyboard_arrow_right,size:30,),
        ],
      ),
    );
  }
}
