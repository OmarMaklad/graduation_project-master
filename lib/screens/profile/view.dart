import 'package:flutter/material.dart';
import 'package:graduation_project/widgets/appBar.dart';
import 'package:graduation_project/widgets/customButton.dart';
import 'package:graduation_project/widgets/customTextFeild.dart';

import '../../constants.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Column(
        children: [
          CustomAppBar(title: "Profile",),
          SizedBox(height: 30,),
          CircleAvatar(
            maxRadius: 40,
            backgroundColor: Colors.green,
            child: CircleAvatar(
              maxRadius: 38,
              backgroundColor: Colors.white,
            ),
          ),
          SizedBox(height: 30,),
          CustomTextField(
            hint: "User Name",
          ),
          CustomTextField(
            hint: "address",
          ),
          CustomTextField(
            hint: "phone",
          ),

          SizedBox(height: 30,),
          CustomButton(onPressed: (){}, title: "Edit",color: Colors.green,)

        ],
      ),
    );
  }
}