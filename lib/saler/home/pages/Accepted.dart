import 'package:flutter/material.dart';
import 'package:graduation_project/Admin/views/home/pages/items/orderCard.dart';
import 'package:graduation_project/saler/home/pages/Itemcard.dart';
import 'package:graduation_project/widgets/appBar.dart';
import 'package:graduation_project/widgets/customButton.dart';

class OrdersAccepted extends StatefulWidget {
  @override
  _OrdersAcceptedState createState() => _OrdersAcceptedState();
}

class _OrdersAcceptedState extends State<OrdersAccepted> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        CustomAppBar(title: "Orders",),
        Expanded(
          child: ListView.separated(
              itemBuilder:(cxt,index)=>ItemCard(),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              separatorBuilder: (ctx,ind)=>SizedBox(height:15,),
              itemCount:10),
        ),
      ],
    );
  }
}
