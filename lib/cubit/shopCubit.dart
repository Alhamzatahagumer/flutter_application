import 'package:flutter/material.dart';
import 'package:flutter_application_1/cashHelper/constant.dart';
import 'package:flutter_application_1/cubit/shopState.dart';
import 'package:flutter_application_1/models/homeModel.dart';
import 'package:flutter_application_1/remot/dio.dart';
import 'package:flutter_application_1/remot/endPoint.dart';
import 'package:flutter_application_1/screen/HomeScreen.dart';
import 'package:flutter_application_1/screen/cardScreen.dart';
import 'package:flutter_application_1/screen/orderScreen.dart';
import 'package:flutter_application_1/screen/profileScreen.dart';
import 'package:flutter_application_1/screen/shopLyout.dart';
import 'package:flutter_application_1/screen/wishListScreen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Shopcubit extends Cubit<Shopstate>{
 Shopcubit() : super(shopInitialState()); 

  static Shopcubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> buttomNavigator = [
    Homescreen(),
    Wishlistscreen(),
    Orderscreen(),
    Cardscreen(),
    Profilescreen(),
  ];

  void changeBottomNavigator(int index) {
    currentIndex = index;
    emit(shopBottomNavigator());
  }

  Homemodel? homemodel; // استخدام nullability
  void HomeGetData() {
  emit(shopLoadingState());
  DioClient.getRequest(
    endpoint: HOME,
    token: token,
  ).then((value) {
    homemodel = Homemodel.fromJson(value.data);
    print("Home model loaded: ${homemodel.toString()}");
    emit(shopSucessState());
  }).catchError((error) {
    print("Error loading home data: $error");
    emit(shopErrorState());
  });
}

}