import 'package:flutter/material.dart';

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

