import 'package:flutter/material.dart';
import 'package:graduation_project/Admin/views/home/pages/items/orderCard.dart';
import 'package:graduation_project/saler/home/controllers/profileController.dart';
import 'package:graduation_project/saler/home/models/sealerOrderModel.dart';
import 'package:graduation_project/saler/home/pages/Itemcard.dart';
import 'package:graduation_project/widgets/appBar.dart';
import 'package:graduation_project/widgets/customButton.dart';
import 'package:graduation_project/widgets/loading_indicator.dart';

class OrdersAccepted extends StatefulWidget {
  @override
  _OrdersAcceptedState createState() => _OrdersAcceptedState();
}

class _OrdersAcceptedState extends State<OrdersAccepted> {
  ProfileController _profileController = ProfileController();
  SealerOrdersModel _ordersModel =SealerOrdersModel();
  bool loading = true;
  void _getOrders ()async{
    _ordersModel = await _profileController.getOrders();
    setState(() {
      loading = false;
    });
  }
  @override
  void initState() {
    _getOrders();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return loading?LoadingIndicator():Column(
      children: [
        CustomAppBar(title: "Orders",),
        _ordersModel.data.isEmpty?
            Padding(
              padding: EdgeInsets.only(top:height*.3),
              child:Text("No Orders Accept Yet",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)
            ):Expanded(
          child: ListView.separated(
              itemBuilder:(cxt,index)=>ItemCard(
                 image: _ordersModel.data[index].productImage,
                 name: _ordersModel.data[index].productName,
                 sName: _ordersModel.data[index].productPrice,
              ),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              separatorBuilder: (ctx,ind)=>SizedBox(height:15,),
              itemCount:_ordersModel.data.length),
        ),
      ],
    );
  }
}
