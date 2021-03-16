import 'package:flutter/material.dart';
import 'package:graduation_project/core/router.dart';
import 'package:graduation_project/core/shared_preferences.dart';
import 'screens/splash/splash_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SharedHelper.getUser();
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
      onGenerateRoute: onGenerateRoute,
      navigatorKey: navigatorKey,
      theme: ThemeData(
          accentColor: Colors.greenAccent, primaryColor: Colors.greenAccent),
      home: SplashScreen(),
    );
  }
}
