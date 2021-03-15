import 'package:flutter/material.dart';
import 'package:graduation_project/widgets/appBar.dart';
import 'package:graduation_project/widgets/customButton.dart';
import 'package:graduation_project/widgets/customTextFeild.dart';

import '../../../constants.dart';

class DonationView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: ListView(
        children: [
          Container(
            height: height*.3,
            margin: EdgeInsets.symmetric(vertical:height*.05,horizontal: height*.08),
            padding: EdgeInsets.symmetric(vertical:height*.04),
            decoration: BoxDecoration(
                color:Colors.white ,
                borderRadius: BorderRadius.circular(5)
            ),
            child: Column(
              children: [
                Text("currentBal",style: TextStyle(fontSize: 16,color: kPrimaryColor,fontWeight: FontWeight.bold),),
                SizedBox(height: height*.03,),
                Text("100",style: TextStyle(fontSize:48,fontWeight: FontWeight.bold)),
                Text("RS",style: TextStyle(fontSize: 37,color:kTextColor,fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          CustomTextField(
            hint: "amount",
          ),
          CustomTextField(
            hint:"A charity name",
          ),
          CustomTextField(
            hint: "A charity Iban",
          ),
          CustomTextField(
            hint: "account name",
          ),
          SizedBox(height: 10,),
          CustomButton(onPressed: (){}, title:"Send",color: Colors.green,)
        ],
      ),
    );
  }
}
