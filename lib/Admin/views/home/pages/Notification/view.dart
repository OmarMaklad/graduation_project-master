import 'dart:io';
import 'package:flutter/material.dart';
import 'package:graduation_project/ui_widgets/custom_button.dart';
import 'package:graduation_project/ui_widgets/text_field.dart';
import 'package:graduation_project/widgets/appBar.dart';
import 'package:graduation_project/widgets/customButton.dart';
import 'package:graduation_project/widgets/customTextFeild.dart';

import 'card.dart';


class NotificationView extends StatefulWidget {

  @override
  _NotificationViewState createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return WillPopScope(
      onWillPop: ()async{
        return  exit(0);
      },
      child: Column(
        children: [
          CustomAppBar(title: "Notifications",),
          Expanded(
            child: ListView(
              children: [
               Padding(
                 padding:  EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                 child: Text("Send Notification To Saler And Bayer ",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
               ),
               CustomTextField(hint: "notification Body",),
               CustomButton(onPressed: (){},color: Colors.green,title: "Send",),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 20,vertical: 30),
                  child: Text("Send Notification To Saler ",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                ),
                CustomTextField(hint: "notification Body",),
                CustomButton(onPressed: (){},color: Colors.green,title: "Send",),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 20,vertical: 30),
                  child: Text("Send Notification To  Bayer ",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                ),
                CustomTextField(hint: "notification Body",),
                CustomButton(onPressed: (){},color: Colors.green,title: "Send",),
                SizedBox(height: height*.05,),
                CustomButton(onPressed: (){},color: Colors.red,title: "Connect With DataBase",),
                SizedBox(height: height*.05,),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
