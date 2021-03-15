import 'dart:async';

import 'package:flutter/material.dart';
import 'package:graduation_project/constants.dart';
import 'package:graduation_project/screens/login/view.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => loggedUser.isLogged ? getHomeByType() : LoginScreen()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 50),
        child: Center(
          child: Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10)),
              child: Image.asset('assets/imgs/logo.jpeg')),
        ),
      ),
    );
  }
}
