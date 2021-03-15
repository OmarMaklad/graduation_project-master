import 'package:flutter/material.dart';

import '../../constants.dart';
import 'bottom_sh.dart';


class BuyBasket extends StatefulWidget {

  @override
  _BuyBasketState createState() => _BuyBasketState();
}

class _BuyBasketState extends State<BuyBasket> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor:Colors.white,
      body:Stack(
        children: [
          Container(
            height: height*.8,
            color: Colors.white,
            child: ListView.builder(
              itemCount: 10,
              itemBuilder:(ctx,index)=>
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: height*.12,
                          child: Column(
                            children: [
                              IconButton(icon: Icon(Icons.delete,
                                color: Colors.red,), onPressed:(){

                              }),
                              Expanded(
                                child: Row(
                                  children: [
                                    InkWell(
                                      child: CircleAvatar(
                                        backgroundColor: kHomeColor,
                                        maxRadius: 12,
                                        child: Icon(Icons.remove,color: kTextColor,size: 18,),
                                      ),
                                      onTap: (){
                                      },
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 5),
                                      child: Text(
                                     "2",
                                        style: TextStyle(fontSize: 16,color: kPrimaryColor,fontFamily: "dinnextl medium"),),
                                    ),
                                    InkWell(
                                      onTap: (){

                                      },
                                      child: CircleAvatar(
                                        backgroundColor: kHomeColor,
                                        maxRadius: 12,
                                        child: Icon(Icons.add,color: kTextColor,size: 18,),
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                        Row(
                          children: [
                            Padding(
                              padding:  EdgeInsets.symmetric(horizontal:12),
                              child: Column(
                                children: [
                                  Text("Jacket",
                                    style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: kPrimaryColor),),
                                  SizedBox(height: 15,),
                                  Text( "women",
                                    style: TextStyle(fontSize: 14,color: kTextColor,
                                        fontFamily: "dinnextl medium"),),
                                ],
                              ),
                            ),
                            Container(
                              height: height*.12,
                              width: height*.12,
                              decoration: BoxDecoration(
                                  color: Colors.yellow,
                                  borderRadius: BorderRadius.circular(10)
                              ),
                            ),
                          ],
                        ),


                      ],
                    ),
                  ),
            ),
          ),
         BottomSh(
           numPro: "3",
           totalPr: "2000",
           proPr: "5000",
           delPr: "2222",
           onTap: (){

           },
         ),
        ],
      ),
    );
  }
}
