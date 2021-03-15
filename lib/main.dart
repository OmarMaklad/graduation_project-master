import 'package:flutter/material.dart';
import 'package:graduation_project/relockMaker/home/view.dart';
import 'screens/splash/splash_screen.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          accentColor: Colors.greenAccent, primaryColor: Colors.greenAccent),
      home: SplashScreen(),
    );
  }
}
