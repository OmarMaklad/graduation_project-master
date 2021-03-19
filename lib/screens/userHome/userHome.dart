import 'package:flutter/material.dart';
import 'package:graduation_project/screens/home/controller/controller.dart';
import 'package:graduation_project/screens/home/model/model.dart';
import 'package:graduation_project/screens/productDetails/view.dart';
import 'package:graduation_project/widgets/appBar.dart';
import 'package:graduation_project/widgets/customTextFeild.dart';
import 'package:graduation_project/widgets/loading_indicator.dart';
import '../../constants.dart';


class UserHome extends StatefulWidget {
  @override
  _UserHomeState createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  BayerHomeController _homeController = BayerHomeController();
  HomeModel _homeModel =HomeModel();
  HomeModel _search =HomeModel();
  bool loading = true;
  void _getCate()async{
    _search = await _homeController.getHome();
    setState(() {
      loading=false;
      _homeModel.data = [..._search.data];
    });
  }

  @override
  void initState() {
    _getCate();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        CustomAppBar(title: "Home",),
    CustomTextField(
      hint:"search",
      dIcon: Icons.search,
      onsave: (value){
        value = value.toLowerCase();
        if (value.isNotEmpty) {
          setState(() {
            _homeModel.data = [
              ..._search.data.where((ele) {
                var all = ele.name.toLowerCase();
                return all.contains(value);
              }).toList()
            ];
          });
        } else {
          _homeModel.data = [..._search.data];
        }
      },
    ),
   loading?LoadingIndicator(): Expanded(
      child: _homeModel.data.isEmpty?
      Padding(
          padding: EdgeInsets.only(top:height*.3),
          child:Text("No Orders Yet",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)
      ):Padding(
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
            print(_search.data[index].id);
            Navigator.push(context, MaterialPageRoute(builder: (_)=>ProductDetails(
              id: _search.data[index].id,
            )));
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
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage("http://eco.ehtwa.site/public/dash/assets/img/${_search.data[index].image}"),
                            ),
                          borderRadius: BorderRadius.circular(15)),
                    ),
                  ],
                ),
                SizedBox(height: 5,),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 5),
                  child: Text(_search.data[index].name,style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold)),
                ),
                SizedBox(height: 5,),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 3),
                  child: Row(children: [
                    Icon(Icons.category,size: 15,color: kPrimaryColor,),
                    Text(_search.data[index].category,style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold)),
                  ],),
                ),
                SizedBox(height: 5,),
              ],
            ),
          ),
        ),
        itemCount:_search.data.length),
      ),
    ),
      ],
    );
  }
}
