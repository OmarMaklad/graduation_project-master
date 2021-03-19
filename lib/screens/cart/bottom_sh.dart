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
      maxChildSize:.3,
      initialChildSize:.2 ,
      minChildSize:.2,
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
              padding:  EdgeInsets.symmetric(horizontal: 20,vertical: 30),
              child: CustomButton(onPressed:widget.onTap, title: "Buy Now",color: Colors.green,),
            ),
          ],
        ),
      ),);
  }
}
