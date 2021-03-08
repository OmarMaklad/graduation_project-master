import 'package:flutter/material.dart';
import 'package:graduation_project/Admin/views/home/pages/items/orderCard.dart';
import 'package:graduation_project/relockMaker/home/widgets/order_card.dart';
import 'package:graduation_project/saler/home/pages/Itemcard.dart';
import 'package:graduation_project/widgets/appBar.dart';

class ReLockMakerOrdersView extends StatefulWidget {
  @override
  _ReLockMakerOrdersViewState createState() => _ReLockMakerOrdersViewState();
}

class _ReLockMakerOrdersViewState extends State<ReLockMakerOrdersView> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        CustomAppBar(title: "Orders",),
        Expanded(
          child: ListView.separated(
              itemBuilder:(cxt,index)=>ReLockMakerOrderCard(),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              separatorBuilder: (ctx,ind)=>SizedBox(height:15,),
              itemCount:10),
        ),
      ],
    );
  }
}
