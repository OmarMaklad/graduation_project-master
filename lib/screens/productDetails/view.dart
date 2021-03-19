import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/screens/cart/view.dart';
import 'package:graduation_project/screens/home/controller/controller.dart';
import 'package:graduation_project/screens/home/model/productModel.dart';
import 'package:graduation_project/widgets/customButton.dart';
import 'package:graduation_project/widgets/customTextFeild.dart';
import 'package:graduation_project/widgets/loading_indicator.dart';
import '../../constants.dart';

class ProductDetails extends StatefulWidget {
  final int id;

  const ProductDetails({Key key, this.id}) : super(key: key);
  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {

  BayerHomeController _homeController =BayerHomeController();
  ProductModel _productModel =ProductModel();
  bool loading = true;
  void _getProduct()async{
    _productModel = await _homeController.getProduct(widget.id);
    setState(() {
      loading = false;
    });
  }
  @override
  void initState() {
    _getProduct();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final height =MediaQuery.of(context).size.height;
    return  Scaffold(
      backgroundColor: kBackgroundColor,
      body: loading?LoadingIndicator(): Column(
        children: [
          Stack(
            children: [
              Container(
                height: height*.4,
                width: double.infinity,
                color: Colors.red,
                child: Image.network("http://eco.ehtwa.site/public/dash/assets/img/${_productModel.data.image}", fit: BoxFit.cover,),
              ),
              Padding(
                padding: EdgeInsets.only(top:height*.25),
                child: Container(
                  height: height*.7,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(top: Radius.circular(30))
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                        child: Text(_productModel.data.name,
                          style: TextStyle(fontSize:24,fontWeight: FontWeight.w600),),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text("${_productModel.data.price} SAR",
                          style: TextStyle(fontSize: 18,color: Colors.green,
                              fontWeight: FontWeight.w600),),
                      ),

                      SizedBox(height:25,),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text("description",style: TextStyle(fontSize:18,
                             fontWeight: FontWeight.w600),),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                        child: Text(_productModel.data.desc,
                          style: TextStyle(fontSize: 14,color: kTextColor,fontWeight: FontWeight.w600),),
                      ),
                      SizedBox(height:5,),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child: Text("if you wand make it with RelockMaker",style: TextStyle(fontSize:16,
                            fontWeight: FontWeight.w600),),
                      ),
                      CustomTextField(
                        hint: "desc",
                        line: true,
                      ),
                      CustomButton(onPressed: (){}, title: "Sent To RelockMaker",color: Colors.green,),
                      CustomButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (_)=>BuyBasket()));
                      }, title: "Add to Cart",color: Colors.red,)

                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
