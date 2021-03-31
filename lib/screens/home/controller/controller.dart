import 'dart:io';

import 'package:dio/dio.dart';
import 'package:graduation_project/core/network/network.dart';
import 'package:graduation_project/saler/home/models/addModel.dart';
import 'package:graduation_project/saler/home/models/notiffication.dart';
import 'package:graduation_project/saler/home/models/profileModel.dart';
import 'package:graduation_project/saler/home/models/sealerOrderModel.dart';
import 'package:graduation_project/screens/home/model/addToMaker.dart';
import 'package:graduation_project/screens/home/model/model.dart';
import 'package:graduation_project/screens/home/model/productModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../constants.dart';


class BayerHomeController {
  HomeModel _homeModel = HomeModel();
  Future<HomeModel> getHome()async{
    final response = await dioGet('homeproducts');
    _homeModel = HomeModel.fromJson(response.data);
    return _homeModel;
  }
  ProductModel _productModel =ProductModel();
  Future<ProductModel> getProduct(int id)async{
    print(id);
    final response = await dioPost('show_product',
        body: {
         "product_id": id,
        });
    _productModel = ProductModel.fromJson(response.data);
    return _productModel;
  }

  AddToMakerModel _makerModel =AddToMakerModel();
  Future<AddToMakerModel> sendMaker(int id,String desc,int days)async{
    print(id);
    final response = await dioPost('add_order_to_maker',
        body: {
          "product_id": id,
          "desc":desc,
          "days":days,
    });
    _makerModel = AddToMakerModel.fromJson(response.data);
    return _makerModel;
  }

}
