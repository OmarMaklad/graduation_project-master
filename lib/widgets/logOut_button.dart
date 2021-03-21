import 'package:flutter/material.dart';
import 'package:graduation_project/core/router.dart';
import 'package:graduation_project/core/shared_preferences.dart';
import 'package:graduation_project/screens/splash/splash_screen.dart';

class LogoutButton extends StatelessWidget {
  final darkColor;
  LogoutButton({this.darkColor = false});
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.sensor_door_outlined,color: darkColor ? Colors.black :  Colors.white),
      onPressed: (){
        SharedHelper.clear();
        MagicRouter.navigateAndPopAll(SplashScreen());
      },
    );
  }
}
