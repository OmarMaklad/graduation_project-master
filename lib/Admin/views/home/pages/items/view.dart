import 'package:flutter/material.dart';
import 'package:graduation_project/widgets/appBar.dart';

import 'orderCard.dart';
class Orders extends StatefulWidget {
  @override
  _OrdersState createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        CustomAppBar(title: "Orders Request",),
      Expanded(
            child: ListView.separated(
                itemBuilder:(cxt,index)=>OrderCard(

                ),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                separatorBuilder: (ctx,ind)=>SizedBox(height:15,),
                itemCount:10),
        ),
      ],
    );
  }
}
