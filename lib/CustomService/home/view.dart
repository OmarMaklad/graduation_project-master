import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/Admin/views/home/pages/Notification/view.dart';
import 'package:graduation_project/Admin/views/home/pages/allChats/view.dart';
import 'package:graduation_project/Admin/views/home/pages/items/view.dart';
import 'package:graduation_project/CustomService/home/pages/reports.dart';
import '../../constants.dart';


class CustomServiceHome extends StatefulWidget {
  final int screenIndex;
  CustomServiceHome({ this.screenIndex});
  @override
  _CustomServiceHomeState createState() => _CustomServiceHomeState();
}
class _CustomServiceHomeState extends State<CustomServiceHome> {

  int userScreenIndex = 1;
  List<Widget> userScreens= [
    AllReports(),
    AllChats(),
  ];

  @override
  void initState() {
    if(widget.screenIndex!=null){
      setState(() {
        userScreenIndex= widget.screenIndex;
      });
    }

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: userScreens[userScreenIndex],
      bottomNavigationBar: CurvedNavigationBar(
        color: Colors.white,
        backgroundColor:kBackgroundColor,
        buttonBackgroundColor: Colors.white,
        height:65,
        index: userScreenIndex,
        animationDuration: Duration(
            milliseconds:200
        ),
        animationCurve: Curves.bounceInOut,
        items: <Widget>[
          Icon(Icons.home, size: 30,color: Colors.green,),
          Icon(Icons.chat,size: 30,color: Colors.green,)
        ],
        onTap: (index) {
          setState(() {
            userScreenIndex = index;
          });
        },
      ),
    );
  }
}
