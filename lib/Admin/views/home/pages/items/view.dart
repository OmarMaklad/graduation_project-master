import 'package:flutter/material.dart';
import 'package:graduation_project/Admin/views/home/controller.dart';
import 'package:graduation_project/Admin/views/home/models/products.dart';
import 'package:graduation_project/widgets/appBar.dart';
import 'package:graduation_project/widgets/loading_indicator.dart';

import 'orderCard.dart';
class Orders extends StatefulWidget {
  @override
  _OrdersState createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  bool _isLoading = true;
  AdminProductsModel _adminProductsModel;

  initState(){
    getProducts();
    super.initState();
  }

  getProducts()async{
    _adminProductsModel = await AdminHomeController().getProducts();
    setState(()=> _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        CustomAppBar(title: "Orders Request",logout: true,),
      Expanded(
            child: _isLoading ? LoadingIndicator() : ListView.separated(
                itemBuilder:(cxt,index){
                  final order = _adminProductsModel.data[index];
                  return OrderCard(
                    itemName: order.name,
                    onAction: getProducts,
                    image: order.image,
                    selarName: order.sealerFirstName + ' ' + order.sealerLastName,
                    orderId: order.id,
                  );
                },
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                separatorBuilder: (ctx,ind)=>SizedBox(height:15,),
                itemCount: _adminProductsModel.data.length,
            ),
        ),
      ],
    );
  }
}
