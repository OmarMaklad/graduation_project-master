import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/Admin/views/home/pages/Notification/view.dart';
import 'package:graduation_project/Admin/views/home/pages/allChats/view.dart';
import 'package:graduation_project/Admin/views/home/pages/items/view.dart';
import 'package:graduation_project/relockMaker/home/screens/chats.dart';
import 'package:graduation_project/relockMaker/home/screens/notifications.dart';
import 'package:graduation_project/relockMaker/home/screens/orders.dart';
import 'package:graduation_project/saler/home/pages/Accepted.dart';
import 'package:graduation_project/saler/home/pages/AddItems.dart';
import 'package:graduation_project/saler/home/pages/notifications.dart';
import '../../constants.dart';


class ReLockMakerScreen extends StatefulWidget {
  final int screenIndex;
  ReLockMakerScreen({ this.screenIndex});
  @override
  _ReLockMakerScreenState createState() => _ReLockMakerScreenState();
}
class _ReLockMakerScreenState extends State<ReLockMakerScreen> {

  int userScreenIndex = 1;
  List<Widget> userScreens= [
    ReLockMakerNotificationView(),
    ReLockMakerOrdersView(),
    ReLockMakerAllChatsView(),
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