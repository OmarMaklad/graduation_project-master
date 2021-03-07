import 'package:flutter/material.dart';

import '../../../../../constants.dart';

class NotificationCard extends StatefulWidget {
  final String text;
  final int id;


   NotificationCard({ this.text,this.id,});

  @override
  _NotificationCardState createState() => _NotificationCardState();
}

class _NotificationCardState extends State<NotificationCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal:8,vertical: 8),
      margin: EdgeInsets.symmetric(horizontal:10,),
      decoration: BoxDecoration(
        color: kBackgroundColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.green),
      ),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 15,vertical: 10),
              child: Text(widget.text,
                textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),),
            ),
          ),
          GestureDetector(
            onTap: (){


            },
              child: Icon(Icons.delete,color: Colors.red,size: 25,)),
        ],
      ),
    );
  }
}
