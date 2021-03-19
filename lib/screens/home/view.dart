import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/Admin/views/home/pages/allChats/view.dart';
import 'package:graduation_project/screens/cart/view.dart';
import 'package:graduation_project/screens/more/view.dart';
import 'package:graduation_project/screens/profile/view.dart';
import 'package:graduation_project/screens/userHome/userHome.dart';
import '../../constants.dart';



class HomeScreen extends StatefulWidget {
  final int screenIndex;
  HomeScreen({ this.screenIndex});
  @override
  _HomeScreenState createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {

  int userScreenIndex = 2;
  List<Widget> userScreens= [
    ProfileScreen(),
    BuyBasket(),
    UserHome(),
    Text(''),
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
          Icon(Icons.person, size:30,color: Colors.green,),
          Icon(Icons.shopping_cart, size:30,color: Colors.green,),
          Icon(Icons.home, size: 30,color: Colors.green,),
          Icon(Icons.chat, size:30,color: Colors.green,),
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
