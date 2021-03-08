import 'package:flutter/material.dart';
import 'package:graduation_project/widgets/appBar.dart';
import 'card.dart';

class AllReports extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBar(title: "Reports",),
            Padding(
              padding:  EdgeInsets.only(top:40,left: 20),
              child: Text('Reports',style: TextStyle(
                  fontWeight: FontWeight.w900,fontSize: 20
              ),),
            ),
            SizedBox(height: 20,),
            Expanded(
              child: ListView.builder(
                  itemCount: 4,
                  itemBuilder: (_,index)=>ReportsCard()),
            ),
          ],
        ),

    );
  }
}
