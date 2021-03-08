import 'dart:io';
import 'package:flutter/material.dart';
import 'package:graduation_project/Admin/views/home/pages/Notification/card.dart';
import 'package:graduation_project/widgets/appBar.dart';


class ReLockMakerNotificationView extends StatefulWidget {

  @override
  _ReLockMakerNotificationViewState createState() => _ReLockMakerNotificationViewState();
}

class _ReLockMakerNotificationViewState extends State<ReLockMakerNotificationView> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return WillPopScope(
      onWillPop: ()async{
        return  exit(0);
        // showDialog(context:context,child:  AlertDialog(
        //   shape: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        //   content: Container(
        //     height:MediaQuery.of(context).size.height*.15,
        //     width: double.infinity,
        //     child: Column(
        //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //       children: [
        //         Text("Do You Want LogOut",
        //           style: TextStyle(
        //               color: kPrimaryColor,
        //               fontSize: 16,
        //               fontFamily: "dinnextl bold"),),
        //         Divider(height: 2,color: kTextColor,),
        //         Row(
        //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //           children: [
        //             FlatButton(onPressed:(){
        //               Navigator.pop(context);
        //             }, child:Text("No",
        //               style:
        //               TextStyle(fontSize: 16,color: kPrimaryColor,
        //                   fontWeight: FontWeight.w600),)),
        //             Container(height: 50,width: 1,color: kTextColor,),
        //             FlatButton(
        //                 onPressed:(){
        //                   _clear();
        //                   Navigator.push(context, MaterialPageRoute(builder: (_)=>SignInView()));
        //                 }, child:Text("Yes",
        //               style: TextStyle(fontSize: 16,color: kPrimaryColor,fontWeight: FontWeight.w600),)),
        //           ],),
        //       ],
        //     ),
        //   ),
        // ));
      },
      child: Column(
        children:[
          CustomAppBar(title: "Notifications",),
          Expanded(child: ListView.separated(
              itemBuilder:(cxt,index)=>NotificationCard(
                text: "Items You Add Has Accepted",

              ),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              separatorBuilder: (ctx,ind)=>SizedBox(height:15,),
              itemCount:10)),
        ],
      ),
    );
  }
}
