import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/widgets/logOut_button.dart';

import '../constants.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool logout;
  CustomAppBar({this.logout = false,this.title, this.icon});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Container(
          height: height * .12,
          width: double.infinity,
          padding: EdgeInsets.only(top: height * .05),
          decoration: BoxDecoration(
              color: Colors.green,
            borderRadius: BorderRadius.only(bottomLeft:Radius.circular(40),bottomRight:Radius.circular(40) )
          ),

          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
          Icon(icon,color: Colors.white,size: 20,),
          SizedBox(width: 5,),
          Text(
            title,
            style: TextStyle(
                fontSize: 18,  fontWeight: FontWeight.bold,color: Colors.white),
          ),
            ],
          ),
        ),
        if(logout)
          Positioned(bottom: 0,left: 20,child: LogoutButton()),
      ],
    );
  }
}
