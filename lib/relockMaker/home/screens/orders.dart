import 'package:flutter/material.dart';
import 'package:graduation_project/Admin/views/home/pages/items/orderCard.dart';
import 'package:graduation_project/relockMaker/home/models/orders.dart';
import 'package:graduation_project/relockMaker/home/widgets/order_card.dart';
import 'package:graduation_project/saler/home/pages/Itemcard.dart';
import 'package:graduation_project/widgets/appBar.dart';
import 'package:graduation_project/widgets/loading_indicator.dart';
import 'package:http/http.dart';

import '../controller.dart';

class ReLockMakerOrdersView extends StatefulWidget {
  @override
  _ReLockMakerOrdersViewState createState() => _ReLockMakerOrdersViewState();
}

class _ReLockMakerOrdersViewState extends State<ReLockMakerOrdersView> {

  bool _isLoading = true;

  MakerHomeController _makerHomeController = MakerHomeController();
  MakerOrdersModel _makerOrdersModel;

  initState(){
    getData();
    super.initState();
  }

  Future<void> getData()async{
    _makerOrdersModel = await _makerHomeController.getOrders();
    setState(()=> _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        CustomAppBar(title: "Orders",),
        Expanded(
          child: _isLoading ? LoadingIndicator() : RefreshIndicator(
            onRefresh: getData,
            child: ListView.separated(
                itemBuilder:(cxt,index){
                  final order = _makerOrdersModel.data[index];
                  return ReLockMakerOrderCard(
                  image: order.productImage,
                  itemName: order.productName,
                  orderId: order.id,
                  ownerName: order.sealerFirstName+' '+order.sealerLastName,
                  );
                },
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                separatorBuilder: (ctx,ind)=>SizedBox(height:15,),
                itemCount: _makerOrdersModel.data.length,
            ),
          ),
        ),
      ],
    );
  }
}
