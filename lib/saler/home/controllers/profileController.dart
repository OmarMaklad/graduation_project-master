import 'dart:io';

import 'package:dio/dio.dart';
import 'package:graduation_project/core/network/network.dart';
import 'package:graduation_project/saler/home/models/addModel.dart';
import 'package:graduation_project/saler/home/models/notiffication.dart';
import 'package:graduation_project/saler/home/models/profileModel.dart';
import 'package:graduation_project/saler/home/models/sealerOrderModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../constants.dart';


class ProfileController {
  SealerProfileModel _profileModel = SealerProfileModel();
  Future<SealerProfileModel> getProfile()async{
    final response = await dioGet('profile');
    _profileModel = SealerProfileModel.fromJson(response.data);
    return _profileModel;
  }

  SealerOrdersModel _ordersModel = SealerOrdersModel();
  Future<SealerOrdersModel> getOrders()async{
    final response = await dioGet('sealer_orders');
    _ordersModel = SealerOrdersModel.fromJson(response.data);
    return _ordersModel;
  }

  NotificationModel _notificationModel = NotificationModel();
  Future<NotificationModel> getNotification()async{
    final response = await dioGet('sealer_nots');
    _notificationModel = NotificationModel.fromJson(response.data);
    return _notificationModel;
  }

  Future<SealerProfileModel> editProfile(String fName,lName,email,password,File image)async{
    final response = await dioPost('editprofile',
        body: {
      if(image!=null)
          "image": await MultipartFile.fromFile(image.path),
      if(fName!=null)
      'first_name':fName,
          if(lName!=null)
      'last_name':lName,
          if(email!=null)
      'email':email,
          if(password!=null)
      'password':password,
    });
    _profileModel = SealerProfileModel.fromJson(response.data);
    return _profileModel;
  }

  AddModel _addModel =AddModel();
  Future<AddModel> addItems(
      {String name, desc, category, var price, File image})async{
    final response = await dioPost('addproduct',
        body: {
      "image": await MultipartFile.fromFile(image.path),
      'name':name,
      'desc':desc,
      'category':category,
      'price':price,
    });
    print("jlhl"*100);
  }
}
