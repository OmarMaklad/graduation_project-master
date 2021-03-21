import 'package:flutter/material.dart';
import 'package:graduation_project/CustomService/home/controller.dart';
import 'package:graduation_project/CustomService/home/models/reports.dart';
import 'package:graduation_project/widgets/appBar.dart';
import 'package:graduation_project/widgets/loading_indicator.dart';
import '../widgets/card.dart';

class AllReports extends StatefulWidget {
  @override
  _AllReportsState createState() => _AllReportsState();
}

class _AllReportsState extends State<AllReports> {
  bool _isLoading = true;
  ServiceReportsModel _serviceReportsModel;
  initState(){
    getReports();
    super.initState();
  }
  getReports()async{
    _serviceReportsModel = await ServiceHomeController().getReports();
    setState(()=> _isLoading = false);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBar(title: "Reports",logout: true,),
            Padding(
              padding:  EdgeInsets.only(top:40,left: 20),
              child: Text('Reports',style: TextStyle(
                  fontWeight: FontWeight.w900,fontSize: 20
              ),),
            ),
            SizedBox(height: 20,),
            Expanded(
              child: _isLoading ? LoadingIndicator() : ListView.builder(
                  itemCount: _serviceReportsModel.data.length,
                  itemBuilder: (_,index){
                    final report = _serviceReportsModel.data[index];
                    return ReportsCard(
                      name: report.name,
                      title: report.message,
                      date: report.createdAt.toString(),
                    );
                  }),
            ),
          ],
        ),

    );
  }
}
