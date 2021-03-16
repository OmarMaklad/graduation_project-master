import 'package:flutter/material.dart';

class ReportsCard extends StatelessWidget {
  final String title;
  final String date;
  final String name;

  ReportsCard({this.title, this.date, this.name});
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
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
            Icon(Icons.report,size: 50,color: Colors.red,),
              SizedBox(width: 15,),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(title,style: TextStyle(color:Colors.black,fontSize: 16, fontWeight: FontWeight.bold),),
                  SizedBox(height: 3,),
                  Text(date,style: TextStyle(color:Colors.grey,fontSize: 14, fontWeight: FontWeight.bold),),
                  SizedBox(height: 3,),
                  Text(name,style: TextStyle(color:Colors.grey,fontSize: 14, fontWeight: FontWeight.bold),),
                ],
              ),
            ],
          ),
          CircleAvatar(
            backgroundColor: Colors.green,
            maxRadius: 15,
            child: Icon(Icons.keyboard_arrow_right
              ,size:30,color: Colors.white,),
          ),
        ],
      ),
    );
  }
}
