import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:graduation_project/constants.dart';
import 'package:graduation_project/widgets/appBar.dart';
import 'package:graduation_project/widgets/customButton.dart';
import 'package:graduation_project/widgets/customTextFeild.dart';


class AddItems extends StatefulWidget {
  @override
  _AddItemsState createState() => _AddItemsState();
}

class _AddItemsState extends State<AddItems> {
  String userPhone;
  String carNumber;
  GlobalKey<FormState>_globalKey =GlobalKey<FormState>();
  TextEditingController _controller =TextEditingController();
  TextEditingController _controller1 =TextEditingController();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return  WillPopScope(
      onWillPop: ()async{
        return exit(0);
      },
      child: Form(
        key: _globalKey,
        child: Column(
          children: [
            CustomAppBar(title: "Add Items",),
            Expanded(
              child: ListView(
                children: [
                  Padding(
                    padding:  EdgeInsets.only(top: height*0.05),
                    child: Center(
                      child: Text("Product Details",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),),
                    ),
                  ),

                  SizedBox(height: height*.05,),
                  Container(
                    height: height*.2,
                    margin: EdgeInsets.symmetric(horizontal: 30),
                    decoration: BoxDecoration(
                        color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                       border: Border.all(color: Colors.green),
                    ),
                    child: Center(
                      child: Icon(Icons.camera_alt_outlined,size: 40,color: kTextColor,),
                    ),

                  ),
                  SizedBox(height: height*.02,),

                  CustomTextField(
                      hint: "Product Name",
                      dIcon: Icons.category),
                  CustomTextField(
                      hint: "Product Price",
                    dIcon: Icons.money,
                      ),
                  CustomTextField(
                    hint: "Description",
                   line: true,
                  ),

                  SizedBox(height: height*.07,),
                  CustomButton(onPressed: (){}, title: "Add",color: Colors.green,)

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
