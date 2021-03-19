import 'package:flutter/material.dart';
import 'package:graduation_project/core/validation.dart';
import 'package:graduation_project/widgets/appBar.dart';
import 'package:graduation_project/widgets/customButton.dart';
import 'package:graduation_project/widgets/customTextFeild.dart';

import '../../../constants.dart';

class DonationView extends StatefulWidget {
  @override
  _DonationViewState createState() => _DonationViewState();
}

class _DonationViewState extends State<DonationView> {
  GlobalKey<FormState> _globalKey =GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Form(
         key: _globalKey,
        child: ListView(
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
              valid: Validations.any,
            ),
            CustomTextField(
              hint:"A charity name",
              valid: Validations.any,
            ),
            CustomTextField(
              valid: Validations.any,
              hint: "A charity Iban",
            ),
            CustomTextField(
              valid: Validations.any,
              hint: "account name",
            ),
            SizedBox(height: 10,),
            Builder(
              builder:(_)=> CustomButton(onPressed: (){
                if(_globalKey.currentState.validate()){
                  Scaffold.of(_).showSnackBar(SnackBar(
                      backgroundColor: kPrimaryColor,
                      content: Text(
                        "Thanks For your donation",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      )));
                }
              }, title:"Send",color: Colors.green,),
            )
          ],
        ),
      ),
    );
  }
}
