import 'package:flutter/material.dart';
import 'package:graduation_project/Admin/views/chat/widgets/customTextFeild.dart';
import 'package:graduation_project/screens/cart/cubit/cubit.dart';
import 'package:graduation_project/screens/home/view.dart';
import 'package:graduation_project/widgets/appBar.dart';
import 'package:graduation_project/widgets/customButton.dart';

import '../../constants.dart';

class PayedView extends StatefulWidget {

  @override
  _PayedViewState createState() => _PayedViewState();
}

class _PayedViewState extends State<PayedView> {
  int value;
  int value1;
  double totalPrice = 0 ;
  void _total(){
    AddCubit.get(context).prices.forEach((item) {
      totalPrice += int.parse(item);
    });
  }
  @override
  void initState() {
    print( AddCubit.get(context).prices);
    _total();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = AddCubit.get(context);
    final height =MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(children: [
        CustomAppBar(title: "Payed and Delivery",),
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
              Text("select Company",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: kTextColor),),
              DropdownButton(
                  dropdownColor: Colors.white,
                  value: value1,
                  underline: Container(),
                  items: [
                    DropdownMenuItem(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 40),
                        child: Text("SMSA",
                          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: kPrimaryColor),),
                      ),
                      onTap: (){
                        setState(() {
                          value1=0;
                        });
                      },
                      value:0,
                    ),
                    DropdownMenuItem(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 40),
                        child: Text("Aramex",
                          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: kPrimaryColor),),
                      ),
                      value: 1,
                      onTap: (){
                        setState(() {
                          value1=1;
                        });
                      },
                    ),
                    DropdownMenuItem(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 40),
                        child: Text("DHL",
                          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: kPrimaryColor),),
                      ),
                      value: 2,
                      onTap: (){
                        setState(() {
                          value1=2;
                        });
                      },
                    ),
                    DropdownMenuItem(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 40),
                        child: Text("Zajel",
                          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: kPrimaryColor),),
                      ),
                      value: 3,
                      onTap: (){
                        setState(() {
                          value1=3;
                        });
                      },
                    ),
                    DropdownMenuItem(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 40),
                        child: Text("FedEx",
                          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: kPrimaryColor),),
                      ),
                      value: 4,
                      onTap: (){
                        setState(() {
                          value1=4;
                        });
                      },
                    ),
                  ],
                  onTap: (){

                  },
                  onChanged: (value) {

                  }),
            ],
          ),
        ),
        value1!=null?
        Text("Delivery Price = 30",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: kTextColor),)
        :SizedBox(),
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
              Text("payment",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: kTextColor),),
              DropdownButton(
                  dropdownColor: Colors.white,
                  value: value,
                  underline: Container(),
                  items: [
                    DropdownMenuItem(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 40),
                        child: Text("when Receive",
                          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: kPrimaryColor),),
                      ),
                      onTap: (){
                        setState(() {
                          value=0;
                        });
                      },
                      value:0,
                    ),
                    DropdownMenuItem(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 40),
                        child: Text("From Card",
                          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: kPrimaryColor),),
                      ),
                      value: 1,
                      onTap: (){
                        setState(() {
                          value=1;
                        });
                      },
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
        value1!=null?
        Text("Total Price =${totalPrice + 30}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: kTextColor),)
            :SizedBox(),
        CustomTextField(
          hint: "Card number",
        ),
        CustomTextField(
          hint: "CVV",
        ),
        CustomTextField(
          hint: "coupon",
        ),

        Builder(
          builder: (_)=> CustomButton(
              color: Colors.green,
              onPressed: (){
                setState(() {
                  cubit.names.clear();
                  cubit.category.clear();
                  cubit.images.clear();
                  cubit.prices.clear();
                });
                Scaffold.of(_).showSnackBar(SnackBar(
                    backgroundColor: Colors.green,
                    content: Text(
                      "buy success",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    )));
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>HomeScreen(
                  screenIndex: 2,
                )));
              }, title: "Confirm")
        ),

      ],),
    );
  }
}
