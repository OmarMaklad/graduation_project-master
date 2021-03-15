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
                  Container(
                    height: height*.073,
                    margin: EdgeInsets.symmetric(vertical: 10,horizontal:30),
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border:Border.all(color: Colors.green,width:1) ,
                      color: Colors.white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("select Category",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: kTextColor),),
                        DropdownButton(
                            dropdownColor: Colors.white,
                            value: 0,
                            underline: Container(),
                            items: [
                              DropdownMenuItem(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 40),
                                  child: Text("women",
                                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: kPrimaryColor),),
                                ),
                                value:0,
                              ),
                              DropdownMenuItem(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 40),
                                  child: Text("man",
                                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: kPrimaryColor),),
                                ),
                                value: 1,
                              ),
                              DropdownMenuItem(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 40),
                                  child: Text("children",
                                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: kPrimaryColor),),
                                ),
                                value: 2,
                              ),
                            ],
                            onTap: (){
                            },
                            onChanged: (value) {
                              setState(() {

                              });

                            }),
                      ],
                    ),
                  ),

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
