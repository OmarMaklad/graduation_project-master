import 'package:flutter/material.dart';
import 'package:graduation_project/screens/productDetails/view.dart';
import 'package:graduation_project/widgets/appBar.dart';
import 'package:graduation_project/widgets/customTextFeild.dart';
import '../../constants.dart';


class UserHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        CustomAppBar(title: "Home",),
    CustomTextField(
      hint:"search",
      dIcon: Icons.search,
    ),
    Expanded(
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 20),
        child: GridView.builder(
        gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
            mainAxisSpacing:15,
            crossAxisSpacing: 15,
            childAspectRatio: 1.5/1.8
        ),
        itemBuilder:(ctx,index)=>InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (_)=>ProductDetails()));
          },
          child: Container(
            width: height * .25,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                      height: height * .15,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        // image: DecorationImage(
                        //   fit: BoxFit.cover,
                        //   image: NetworkImage(widget.image)
                        // ),
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(15)),
                    ),
                  ],
                ),
                SizedBox(height: 5,),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 5),
                  child: Text("Flory shop",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold)),
                ),
                SizedBox(height: 5,),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 3),
                  child: Row(children: [
                    Icon(Icons.category,size: 15,color: kPrimaryColor,),
                    Text("Women",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold)),
                  ],),
                ),
                SizedBox(height: 5,),
                // Padding(
                //   padding:  EdgeInsets.symmetric(horizontal: 3),
                //   child: Row(children: [
                //     Icon(Icons.money_off,size: 15,color: kPrimaryColor,),
                //     Text("200",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold)),
                //   ],),
                // ),

              ],
            ),
          ),
        ),
        itemCount:8),
      ),
    ),
      ],
    );
  }
}
