import 'package:flutter/material.dart';
import 'package:graduation_project/widgets/appBar.dart';
import 'package:graduation_project/widgets/customTextFeild.dart';
import 'package:graduation_project/widgets/smallButton.dart';

class ReLockMakerOrderDetailsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: CustomAppBar(title: 'Order Details',),
        preferredSize: Size.fromHeight(AppBar().preferredSize.height),
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text('BuyerName : Jemi',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
          ),
          Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Text('BlaBlaBla'*60),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.black54)
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Price : ',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
             Expanded(
               child: CustomTextField(
                 hint: "price",
               ),
             ),
            ],
          ),
          SizedBox(height: 60,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(child: SmallButton(onPressed: (){}, title: 'Accept',color: Colors.green,)),
              Expanded(child: SmallButton(onPressed: (){}, title: 'Reject',color: Colors.red,)),
            ],
          ),
        ],
      ),
    );
  }
}
