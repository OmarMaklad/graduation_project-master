import 'package:flutter/material.dart';
import 'package:graduation_project/widgets/customButton.dart';
import '../../constants.dart';

class BottomSh extends StatefulWidget {
  final String numPro;
  final String totalPr;
  final String proPr;
  final String delPr;
  final Function onTap;

  const BottomSh({ this.numPro, this.totalPr, this.proPr, this.delPr, this.onTap});

  @override
  _BottomShState createState() => _BottomShState();
}

class _BottomShState extends State<BottomSh> {
  @override
  Widget build(BuildContext context) {
    return  DraggableScrollableSheet(
      expand: true,
      maxChildSize:.5,
      initialChildSize:.15 ,
      minChildSize:.15,
      builder: (ctx,controller)=>Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(40),
          ),
          boxShadow: [BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 5,
          )],
        ),
        child: ListView(
          controller: controller,
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 10,horizontal: 160),
              height:4,
              decoration:BoxDecoration(
                  color: Colors.grey.withOpacity(.5),
                  borderRadius: BorderRadius.circular(7)
              ),),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 30,vertical: 23),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text("allPrice : ",style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),),
                      Text("${widget.totalPr} SAR",style:TextStyle( fontWeight: FontWeight.w600,
                          fontSize: 16,color: Colors.green),),

                    ],
                  ),
                  Row(
                    children: [
                      Text("productSelect",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600,color: Colors.green),),
                      SizedBox(width: 3,),
                      Text(widget.numPro.toString(),style: TextStyle(
                          fontSize: 16,
                          color: kAccentColor,
                          fontWeight: FontWeight.w600)),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30,vertical: 3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Product Price",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 14,),),
                  Text("${widget.proPr}" " SAR",
                    style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16,color: Colors.green),),

                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30,vertical: 3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Delivery Price",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 14,),),
                  Text("${widget.delPr}" " SAR",
                    style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16,color: Colors.green),),

                ],
              ),
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 20,vertical: 30),
              child: CustomButton(onPressed:widget.onTap, title: "buyNow",color: Colors.green,),
            ),
          ],
        ),
      ),);
  }
}
