import 'package:flutter/material.dart';
import 'shared_preferences.dart';

class UserSingleton {
  String fullName;
  // String userName;
  String firstName;
  String lastName;
  // String phoneNumber;
  String image;
  String type;
  String email;
  int id;
  String apiToken;
  bool isLogged = false;

  factory UserSingleton()=> _userSingleton;

  UserSingleton._();
  static UserSingleton _userSingleton = UserSingleton._();

  Future<void> setUser({
    @required String firstName,
    @required String lastName,
    // @required String phoneNumber,
    // @required String userName,
    @required String image,
    @required String type,
    @required String email,
    @required String apiToken,
    @required int id,
    bool isLogged = false,
  })async{
    this.fullName = firstName + ' ' + lastName;
    this.firstName = firstName;
    this.lastName = lastName;
    this.apiToken = apiToken;
    // this.phoneNumber = phoneNumber;
    this.image = image;
    this.email = email;
    this.id = id;
    // this.userName = userName;
    this.type = type;
    this.isLogged = isLogged;
    await SharedHelper.cacheUser();
  }
}