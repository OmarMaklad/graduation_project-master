import 'package:flutter/material.dart';
import 'package:graduation_project/screens/cart/cubit/cubit.dart';
import 'package:graduation_project/screens/payed/view.dart';

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
    final cubit = AddCubit.get(context);
    return Scaffold(
      backgroundColor:Colors.white,
      body:Stack(
        children: [
          Container(
            height: height*.8,
            color: Colors.white,
            child: ListView.builder(
              itemCount: cubit.names.length,
              itemBuilder:(ctx,index)=>
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: height*.12,
                          child: IconButton(icon: Icon(Icons.delete,
                            color: Colors.red,), onPressed:(){
                           setState(() {
                             cubit.names.removeAt(index);
                             cubit.images.removeAt(index);
                             cubit.category.removeAt(index);
                           });
                          }),
                        ),

                        Row(
                          children: [
                            Padding(
                              padding:  EdgeInsets.symmetric(horizontal:12),
                              child: Column(
                                children: [
                                  Text(cubit.names[index],
                                    style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: kPrimaryColor),),
                                  SizedBox(height: 15,),
                                  Text(cubit.category[index],
                                    style: TextStyle(fontSize: 14,color: kTextColor,
                                        fontFamily: "dinnextl medium"),),
                                  SizedBox(height: 15,),
                                  Text(cubit.prices[index],
                                    style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: kPrimaryColor),),

                                ],
                              ),
                            ),
                            Container(
                              height: height*.12,
                              width: height*.12,
                              decoration: BoxDecoration(
                                  color: Colors.yellow,
                                  borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(

                                    image: NetworkImage( "http://eco.ehtwa.site/public/dash/assets/img/${cubit.images[index]}"),
                                )
                              ),
                            ),
                          ],
                        ),


                      ],
                    ),
                  ),
            ),
          ),
         Builder(
           builder: (_)=>BottomSh(
             onTap: (){
            setState(() {
              Navigator.push(context, MaterialPageRoute(builder: (_)=>PayedView()));

            });

             },

           ),
         ),
        ],
      ),
    );
  }
}
