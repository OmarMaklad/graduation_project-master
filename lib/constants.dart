import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/Admin/views/home/view.dart';
import 'package:graduation_project/CustomService/home/view.dart';
import 'package:graduation_project/core/user_singleton.dart';
import 'package:graduation_project/relockMaker/home/view.dart';
import 'package:graduation_project/screens/login/view.dart';

import 'saler/home/view.dart';

Dio dio = Dio()..options.baseUrl = 'http://eco.ehtwa.site/api/';

UserSingleton loggedUser = UserSingleton();

const String DefaultErrorMessage = 'Sorry, Something went wrong!';

Future<Response<dynamic>> post(String path,{Map<String, dynamic> body})=> dio.post(path,data: FormData.fromMap(body));
Future<Response<dynamic>> get(String path,{Map<String, dynamic> headers})=> dio.get(path,queryParameters: headers);

Widget getHomeByType(){
  if(loggedUser.type == 'sealer') return SalerTabsScreen();
  //TODO
  else if(loggedUser.type == 'buyer') return Text('Buyer');
  else if(loggedUser.type == 'admin') return TabsScreen();
  else if(loggedUser.type == 'customer_service') return CustomServiceHome();
  else if(loggedUser.type == 'maker') return ReLockMakerScreen();
  else return LoginScreen();
}

const Color kPrimaryColor = Color(0xff000000);
const Color kAccentColor = Color(0xFF707070);
const Color kTextColor = Color(0xFFB5B5B5);
const Color kBackgroundColor = Color(0xFFF7F7F7);
const Color kHomeColor = Color(0xFFF9F9F9);
const Color kRoundColor = Color(0xFFFEBD2F);

//constant functions
double sizeFromHeight(BuildContext context, double fraction,{bool removeAppBarSize = true}) {
  double deviceHeight = MediaQuery.of(context).size.height;
  fraction = (removeAppBarSize ? (deviceHeight - AppBar().preferredSize.height) : deviceHeight) / (fraction == 0 ? 1 : fraction);
  return fraction;
}

double sizeFromWidth(BuildContext context, double fraction) {
  fraction = MediaQuery.of(context).size.width / (fraction == 0 ? 1 : fraction);
  return fraction;
}

