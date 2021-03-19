import 'package:flutter/material.dart';
import '../../../constants.dart';


class ItemCard extends StatefulWidget {
  final String image;
  final String name;
  final String sName;

  const ItemCard({Key key, this.image, this.name, this.sName}) : super(key: key);
  @override
  _ItemCardState createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height*.27,
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
                  image: DecorationImage(
                    image: NetworkImage("http://eco.ehtwa.site/public/dash/assets/img/${widget.image}"),
                    fit: BoxFit.cover
                  )
                ),

              ),
              SizedBox(width:15,),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Items Name: ",textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: kTextColor),),
                  Text(widget.name,textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,),),
                  SizedBox(height:15,),
                  Text("Selar Name ",textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: kTextColor),),
                  Text(widget.sName,textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),),
                ],
              ),
            ],
          ),
          SizedBox(height: 15,),

        ],
      ),
    );
  }
}
