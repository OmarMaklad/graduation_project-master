import 'package:flutter/material.dart';
import 'package:graduation_project/relockMaker/home/screens/orders.dart';
import 'package:graduation_project/relockMaker/orderDetails/view.dart';
import '../../../constants.dart';


class ReLockMakerOrderCard extends StatefulWidget {
  @override
  _ReLockMakerOrderCardState createState() => _ReLockMakerOrderCardState();
}

class _ReLockMakerOrderCardState extends State<ReLockMakerOrderCard> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> Navigator.of(context).push(MaterialPageRoute(builder: (context) => ReLockMakerOrderDetailsView(),)),
      child: Container(
        height: MediaQuery.of(context).size.height*.3,
        padding: EdgeInsets.symmetric(horizontal:8,vertical:10),
        margin: EdgeInsets.symmetric(horizontal:10,),
        decoration: BoxDecoration(
          color: kBackgroundColor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.green),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height*.2,
                  width: MediaQuery.of(context).size.height*.2,
                  margin: EdgeInsets.symmetric(horizontal:10,vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(20),

                  ),

                ),
                SizedBox(width:15,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Items Name: ",textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: kTextColor),),
                    Text("jacket",textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,),),
                    SizedBox(height:15,),
                    Text("Selar Name ",textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: kTextColor),),
                    Text("Omar",textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),),
                  ],
                ),
              ],
            ),
            SizedBox(height: 15,),

          ],
        ),
      ),
    );
  }
}
