import 'package:flutter/material.dart';
import 'package:flutter_application_1/cashHelper/sharedPref.dart';
import 'package:flutter_application_1/cubit/cubitSignin.dart';
import 'package:flutter_application_1/cubit/shopCubit.dart';
import 'package:flutter_application_1/remot/dio.dart';
import 'package:flutter_application_1/screen/onBoarding.dart';
import 'package:flutter_application_1/screen/shopLyout.dart';
import 'package:flutter_application_1/screen/signin.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_1/cubit/shopState.dart';

void main()async {  
  WidgetsFlutterBinding.ensureInitialized();
  DioClient.init();
  await cashHelper.init();
  Widget widget;
 bool? onBoarding=cashHelper.getData(key: 'onBoarding',);
 var token=cashHelper.getData(key: 'token',);

  
  if(onBoarding != null){
    if(token != null)  widget= Shoplyout();
    else widget=SignInScreen(); 
      }else widget=OnboardingScreen();

  runApp(MyApp(
    startWidget: widget,
  ));
}

class MyApp extends StatelessWidget {

   final Widget? startWidget;

  MyApp({this.startWidget});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create:  (BuildContext context) => SignInScreenCubit(),

         

          // التهيئة إذا لزم الأمر
        ),
        BlocProvider(
          create:   (BuildContext context) => Shopcubit(),

        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'E-commerce App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: startWidget,
        routes: {
          
          '/OnboardingScreen': (context) => OnboardingScreen(),
          '/login': (context) => SignInScreen(),
          '/shopLyout': (context) => Shoplyout(),
        },
      ),
    );
  }
}