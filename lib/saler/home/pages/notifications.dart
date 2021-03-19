import 'dart:io';
import 'package:flutter/material.dart';
import 'package:graduation_project/Admin/views/home/pages/Notification/card.dart';
import 'package:graduation_project/saler/home/controllers/profileController.dart';
import 'package:graduation_project/saler/home/models/notiffication.dart';
import 'package:graduation_project/widgets/appBar.dart';
import 'package:graduation_project/widgets/loading_indicator.dart';


class SalerNotification extends StatefulWidget {

  @override
  _SalerNotificationState createState() => _SalerNotificationState();
}

class _SalerNotificationState extends State<SalerNotification> {
  ProfileController _profileController =ProfileController();
  NotificationModel _notificationModel =NotificationModel();
  bool loading = true;

  void _getNot()async{
    _notificationModel = await _profileController.getNotification();
    setState(() {
      loading = false;
    });
  }

  @override
  void initState() {
    _getNot();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return WillPopScope(
      onWillPop: ()async{
        return  exit(0);
      },
      child: Column(
        children:[
          CustomAppBar(title: "Notifications",),
          loading?LoadingIndicator():
          _notificationModel.data.isEmpty?
          Padding(
              padding: EdgeInsets.only(top:height*.3),
              child:Text("No Orders Accept Yet",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)
          ):Expanded(child:ListView.separated(
              itemBuilder:(cxt,index)=>NotificationCard(
                text: _notificationModel.data[index].body,
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
