// import 'dart:io';
// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:graduation_project/saler/home/bloc/state.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class AddCubit extends Cubit<Add>{
//   AddCubit() : super(AddInitState());
//   static AddCubit get(context)=>BlocProvider.of(context);
//   GlobalKey<FormState> editKey = GlobalKey<FormState>();
//
//   File image;
//   String  nameEn;
//   var phone;
//   String email;
//   String storeNameEn;
//   var idNumber;
//   String cateTypeEn;
//   String inUrl;
//   String password;
//
//
//   Dio _dio = Dio();
//
//   Future<void> editProfile()async{
//
//     emit(AddLoadingState());
//
//     SharedPreferences _prefs = await SharedPreferences.getInstance();
//     print(_prefs.getString("api_token"));
//
//     _dio.options.headers = {
//       "Accept":"application/json",
//       "Content-Type":"application/json",
//       "Authorization":"Bearer ${_prefs.getString("api_token")}",
//     };
//
//     try{
//       final url = 'https://jeeet.net/api/editprofile';
//       FormData formData = FormData.fromMap({
//         if(image!=null)
//           "image": await MultipartFile.fromFile(image.path),
//         if(nameEn!=null)
//           "name":nameEn,
//         if(nameEn!=null)
//           "name_en":nameEn,
//         if(url!=null)
//           "url":inUrl,
//         if(phone!=null)
//           "phone":"+966${phone}",
//         if(idNumber!=null)
//           "commerical_idnumber":"${idNumber}",
//         if(storeNameEn!=null)
//           "store_name":storeNameEn,
//       });
//       print("ثانيه يحب");
//       final Response response = await _dio.post(url,data: formData,options: Options(contentType: "multipart/form-data"));
//       if(response.statusCode!=null&&response.statusCode == 200&&response.data['msg']=="success"){
//         emit(AddSuccessState());
//       }else if(response.statusCode == 200&&response.data['msg']=="error"){
//         emit(AddErrorState(response.data["data"]["phone"]));
//       }
//     }catch(e){
//       if(e.response!=null)
//         emit(AddErrorState(e.toString()));
//     }
//   }
// }
//
