import 'package:flutter/material.dart';
import 'package:graduation_project/widgets/appBar.dart';
import 'package:graduation_project/widgets/customButton.dart';
import 'package:graduation_project/widgets/customTextFeild.dart';


import '../../../constants.dart';
class SettingView extends StatelessWidget {
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
            hint: "Saler",
          ),
          CustomTextField(
            hint: "address",
          ),
          CustomTextField(
            hint: "phone",
          ),
          CustomTextField(
            hint:"clothes" ,
          ),
          SizedBox(height: 30,),
          CustomButton(onPressed: (){}, title: "Edit",color: Colors.green,)

        ],
      ),
    );
  }
}
