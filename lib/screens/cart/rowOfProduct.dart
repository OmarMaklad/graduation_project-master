import 'package:flutter/material.dart';

import '../../constants.dart';

class RowProduct extends StatefulWidget {
  final String name;
  final int total;
  final int count;
  const RowProduct({ this.name, this.total, this.count});

  @override
  _RowProductState createState() => _RowProductState();
}

class _RowProductState extends State<RowProduct> {
  String name;
   int total;
   int count;
   @override
  void initState() {
    count = widget.count;
    super.initState();
  }
  @override

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return  Padding(
      padding:  EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                InkWell(
                  child: CircleAvatar(
                    backgroundColor: kHomeColor,
                    maxRadius: 12,
                    child: Icon(Icons.remove,color: kTextColor,size: 18,),
                  ),
                  onTap: (){
                    setState(() {
                      count ++;
                    });
                  },
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: Text(count.toString(),style: TextStyle(fontSize: 16,color: kPrimaryColor),),
                ),
                CircleAvatar(
                  backgroundColor: kHomeColor,
                  maxRadius: 12,
                  child: Icon(Icons.add,color: kTextColor,size: 18,),
                ),

              ],
            ),
          ),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal:10),
            child: Column(
              children: [
                Text(widget.name,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: kPrimaryColor),),
                SizedBox(height: 15,),
                Text(widget.total.toString(),style: TextStyle(fontSize: 12,color: kTextColor,fontWeight: FontWeight.w600),),
              ],
            ),
          ),
          Container(
            height: height*.12,
            width: height*.12,
            decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/images/pic2.png"),
                ),
                color: Colors.yellow,
                borderRadius: BorderRadius.circular(10)
            ),
          ),
          SizedBox(width: 20,),
          IconButton(icon: Icon(Icons.check_circle_outline,
            color: kTextColor,), onPressed:(){

          }),
        ],
      ),
    );
  }
}
