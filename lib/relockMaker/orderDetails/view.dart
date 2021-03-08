import 'package:flutter/material.dart';
import 'package:graduation_project/widgets/appBar.dart';
import 'package:graduation_project/widgets/smallButton.dart';

class ReLockMakerOrderDetailsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: CustomAppBar(title: 'Order',),
        preferredSize: Size.fromHeight(AppBar().preferredSize.height),
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text('BuyerName : Jemi'),
          ),
          Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Text('BlaBlaBla'*40),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black54)
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Price : '),
              Container(
                padding: EdgeInsets.all(5),
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Text('50 \$'),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black54)
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(child: SmallButton(onPressed: (){}, title: 'Reject',color: Colors.red,)),
              Expanded(child: SmallButton(onPressed: (){}, title: 'Accept',color: Colors.green,)),
            ],
          ),
        ],
      ),
    );
  }
}
