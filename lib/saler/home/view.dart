import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/Admin/views/home/pages/Notification/view.dart';
import 'package:graduation_project/Admin/views/home/pages/allChats/view.dart';
import 'package:graduation_project/Admin/views/home/pages/items/view.dart';
import 'package:graduation_project/saler/home/pages/Accepted.dart';
import 'package:graduation_project/saler/home/pages/AddItems.dart';
import 'package:graduation_project/saler/home/pages/notifications.dart';
import '../../constants.dart';


class SalerTabsScreen extends StatefulWidget {
  final int screenIndex;
  SalerTabsScreen({ this.screenIndex});
  @override
  _SalerTabsScreenState createState() => _SalerTabsScreenState();
}
class _SalerTabsScreenState extends State<SalerTabsScreen> {

  int userScreenIndex = 1;
  List<Widget> userScreens= [
    SalerNotification(),
    OrdersAccepted(),
    AddItems(),
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
          Icon(Icons.notifications, size:30,color: Colors.green,),
          Icon(Icons.home, size: 30,color: Colors.green,),
          Icon(Icons.add, size: 30,color: Colors.green,),
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
