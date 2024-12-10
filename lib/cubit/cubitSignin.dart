import 'package:flutter/material.dart';
import 'package:flutter_application_1/cubit/statesSignIn.dart';
import 'package:flutter_application_1/models/loginModel.dart';
import 'package:flutter_application_1/remot/dio.dart';
import 'package:flutter_application_1/remot/endPoint.dart';
import 'package:flutter_application_1/screen/shopLyout.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class SignInScreenCubit extends Cubit<SignInScreenState> {
 SignInScreenCubit() : super(initialScrrenState()); 


  static SignInScreenCubit get(context)=>BlocProvider.of(context);

  Login? loginModel;


  void UserLogin({

    required String email,
    required String password,
  }){
   DioClient.postData(
    url :LOGIN,
    data:{
      'email':email,
      'password':password
    },).then((value){
      print(value.data);
      loginModel=Login.fromJson(value.data);
      emit(sucessScrrenState(loginModel!));
    }).catchError((error){
      print(error.toString()
      );
    
       
        }
        );
  }

IconData suffix=Icons.visibility_outlined;
bool IsPasswordShowin =true;
void ChangePasswordvisibility(){
  suffix=IsPasswordShowin? Icons.visibility_outlined:Icons.visibility_off_outlined;
  IsPasswordShowin= !IsPasswordShowin;
  emit(visibilityoutlinedState());


}

}


