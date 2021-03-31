import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/core/validation.dart';
import 'package:graduation_project/screens/cart/cubit/cubit.dart';
import 'package:graduation_project/screens/cart/view.dart';
import 'package:graduation_project/screens/home/controller/controller.dart';
import 'package:graduation_project/screens/home/model/addToMaker.dart';
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
 GlobalKey<FormState> _globalKey =GlobalKey<FormState>();
 TextEditingController _controller =TextEditingController();
 TextEditingController _controller1 =TextEditingController();
  BayerHomeController _homeController =BayerHomeController();
  ProductModel _productModel =ProductModel();
  AddToMakerModel _makerModel =AddToMakerModel();
  bool loading = true;
  bool rLoading = false;
  String desc;
  int days;
  void _getProduct()async{
    _productModel = await _homeController.getProduct(widget.id);
    setState(() {
      loading = false;
    });
  }
  void _sendMaker()async{
    setState(() {
      rLoading=true;
    });
    _makerModel = await _homeController.sendMaker(widget.id, desc,days);
    setState(() {
      rLoading = false;
      _controller.clear();
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
      body: loading?LoadingIndicator(): ListView(
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
                  child: Form(
                    key: _globalKey,
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
                          valid: Validations.any,
                          hint: "desc",
                          controller: _controller,
                          onsave: (v){
                            desc=v;
                          },
                          line: true,
                        ),
                        CustomTextField(
                          valid: Validations.any,
                          hint: "Days",
                          type: TextInputType.number,
                          controller: _controller1,
                          onsave: (v){
                            days=v;
                          },
                          line: true,
                        ),
                        rLoading==true?LoadingIndicator():CustomButton(onPressed: (){
                          if(_globalKey.currentState.validate()){
                           _sendMaker();
                          }
                        }, title: "Sent To RelockMaker",color: Colors.green,),
                        CustomButton(onPressed: (){
                          AddCubit.get(context).names.add(_productModel.data.name);
                          AddCubit.get(context).images.add(_productModel.data.image);
                          AddCubit.get(context).category.add(_productModel.data.category);
                          AddCubit.get(context).prices.add(_productModel.data.price);
                        }, title: "Add to Cart",color: Colors.red,)

                      ],
                    ),
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
