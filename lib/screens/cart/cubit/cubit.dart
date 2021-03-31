import 'dart:convert';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/saler/home/bloc/state.dart';
import 'package:graduation_project/screens/cart/state/state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddCubit extends Cubit<CardState> {
  AddCubit() : super(InitialItemState());
  static AddCubit get(context) => BlocProvider.of(context);

  List names = [];
  List images = [];
  List category = [];
  List prices = [];

}
